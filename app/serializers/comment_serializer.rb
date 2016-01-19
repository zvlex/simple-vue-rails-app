class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :children, :parent_id, :tree_depth, :username, :commented_at

  def children
    result = []

    object.children.each do |children|
      result << CommentSerializer.new(children)
    end

    result
  end

  def username
    object.user.email.split(/@/).first
  end

  def commented_at
    object.created_at.strftime("%d %B %Y %H:%M")
  end
end
