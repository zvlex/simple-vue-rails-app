class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :post_votes
  has_many :user_votes, through: :post_votes, source: :user

  def favorites_quantity
    User.active.where('favorite_posts @> ?', "{#{self.id}}").count('*').to_i
  end

  def rating_quantity
    self.post_votes.map(&:rate).reduce(&:+).to_i
  end

  def owned_by?(user)
    self.user == user
  end
end
