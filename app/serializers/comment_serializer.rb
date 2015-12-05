class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :children, :parent_id, :tree_depth

  def children
    result = []

    object.children.each do |children|
      result << CommentSerializer.new(children)
    end

    result
  end

end
