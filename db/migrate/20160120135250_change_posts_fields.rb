class ChangePostsFields < ActiveRecord::Migration
  def up
    remove_columns :posts, :title_ru, :body_ru

    rename_column :posts, :title_en, :title
    rename_column :posts, :body_en, :body
  end

  def down
    add_column :posts, :title_ru, :string
    add_column :posts, :body_ru, :text

    rename_column :posts, :title, :title_en
    rename_column :posts, :body, :body_en
  end
end
