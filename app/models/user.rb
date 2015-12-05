class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts
  has_many :comments

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, presence: true

  scope :admins, -> { where(is_admin: true) }
end
