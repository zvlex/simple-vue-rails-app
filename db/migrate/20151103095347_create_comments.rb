class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.integer :post_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.text :body
      t.string :ip
      t.boolean :is_hidden

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
