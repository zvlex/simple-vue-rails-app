class AddFavoritePostsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorite_posts, :integer, default: [], array: true
  end
end
