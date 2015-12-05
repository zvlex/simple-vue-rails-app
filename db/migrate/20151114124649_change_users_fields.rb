class ChangeUsersFields < ActiveRecord::Migration
  def up
    remove_column :users, :is_active
    add_column :users, :deleted_at, :datetime
  end

  def down
    add_column :users, :is_active, :boolean
    remove_column :users, :deleted_at
  end
end
