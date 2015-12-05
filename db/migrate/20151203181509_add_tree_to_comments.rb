class AddTreeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :tree, :ltree
  end
end
