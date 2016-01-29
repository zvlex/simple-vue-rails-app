class PostSerializer < ActiveModel::Serializer
  include ActionView::Helpers::AssetTagHelper

  attributes :id, :title, :body, :favorites_quantity, :is_empty

  def favorites_quantity
    object.favorites_quantity
  end

  def is_empty
    !scope.included_in_favorites?(object) if scope
  end
end
