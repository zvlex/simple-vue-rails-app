class AddInheritVersionIdToPostVersions < ActiveRecord::Migration
  def change
    add_column :post_versions, :inherit_version_id, :integer, default: 0, null: false
  end
end
