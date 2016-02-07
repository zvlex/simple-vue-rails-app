class AddPostVersionRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :post_version, index: true, foreign_key: true
  end
end
