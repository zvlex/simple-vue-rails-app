class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  def favorites_quantity
    User.active.where('favorite_posts @> ?', "{#{self.id}}").count('*')
  end
end
