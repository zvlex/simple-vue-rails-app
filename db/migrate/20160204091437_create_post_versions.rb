class CreatePostVersions < ActiveRecord::Migration
  def change
    create_table :post_versions do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :aasm_state
      t.string :decline_reason
      t.timestamps null: false
    end
  end
end
