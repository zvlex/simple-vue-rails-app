class RemoveFieldsFromPosts < ActiveRecord::Migration
  def up
    remove_columns :posts, :title, :body, :version
  end

  def down
    add_column :posts, :title, :string
    add_column :posts, :body, :text
    add_column :posts, :version, :integer
  end
end
