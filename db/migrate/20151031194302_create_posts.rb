class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title_ru, null: false
      t.string :title_en, null: false
      t.text :body_ru, null: false
      t.text :body_en, null: false
      t.string :source, null: false
      t.boolean :is_published, null: false, default: false
      t.integer :version, null: false, default: 0

      t.timestamps
    end
  end
end
