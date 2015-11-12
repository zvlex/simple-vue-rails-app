class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, :post_id, presence: true
  validates :body, length: { in: 5..140 }
end
