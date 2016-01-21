class RemoveSourceFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :source, :string
  end
end
