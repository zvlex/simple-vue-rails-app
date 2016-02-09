class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :post_versions

  validates :email, :password, :password_confirmation, presence: true, if: :new_record?

  validates :email, uniqueness: true

  validates :password, length: { minimum: 6 }, if: :new_record?
  validates :password, confirmation: true, if: :new_record?

  scope :admins, -> { where(is_admin: true) }
  scope :active, -> { where(deleted_at: nil) }
  scope :favorites_quantity, -> (post_id) { active.where("favorite_posts @> '{?}'", post_id).count.to_i }

  def add_or_drop_favorites!(post)
    if included_in_favorites?(post)
      drop_favorites(post)
    else
      add_favorites(post)
    end

    self.save!
  end

  def included_in_favorites?(post)
    self.favorite_posts.include?(post.id)
  end

  def drop_favorites(post)
    self.favorite_posts.delete(post.id)
  end

  def add_favorites(post)
   self.favorite_posts << post.id
  end

  def rate_post(post, rate)
    return if post.owned_by?(self)

    unless self.post_votes.where(post: post).exists?
      self.post_votes.create(post: post, rate: rate)
    end
  end

  def create_post_version(params)
    self.post_versions.create(params)
  end
end
