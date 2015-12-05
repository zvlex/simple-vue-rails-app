class Comment < ActiveRecord::Base
  after_create :update_comment_hierarchy

  belongs_to :user
  belongs_to :post

  validates :body, :post_id, presence: true
  validates :body, length: { in: 5..140 }

  scope :parent_comments, -> { where(parent_id: nil) }

  def children
    Comment.where(parent_id: id)
  end

  def tree_depth
    result = ActiveRecord::Base.connection.execute("SELECT NLEVEL('#{tree}')")
    result.getvalue(0, 0)
  end

  def update_comment_hierarchy
    parent_tree = Comment.find_by(id: parent_id).try(:tree)

    ltree = parent_tree ? "#{parent_tree}.#{id}" : id.to_s

    update_column(:tree, ltree)
  end
end
