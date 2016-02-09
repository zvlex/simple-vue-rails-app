class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post_version

  has_many :comments
  has_many :post_votes
  has_many :user_votes, through: :post_votes, source: :user

  def favorites_quantity
    User.favorites_quantity(self.id)
  end

  def rating_quantity
    self.post_votes.map(&:rate).reduce(&:+).to_i
  end

  def owned_by?(user)
    self.user == user
  end
end
