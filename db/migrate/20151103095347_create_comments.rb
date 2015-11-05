class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.integer :post_id
      t.integer :user_id
      t.text :body
      t.string :ip
      t.boolean :is_hidden

      t.timestamps
    end
  end
end
