class PostSerializer < ActiveModel::Serializer
  include ActionView::Helpers::AssetTagHelper

  attributes :id, :title, :body, :favorites_quantity, :is_empty, :votes_quantity, :is_voted, :default_rate, :user_post

  def favorites_quantity
    object.favorites_quantity
  end

  def is_empty
    !scope.included_in_favorites?(object) if scope
  end

  def votes_quantity
    object.rating_quantity
  end

  def is_voted
    object.user_votes.include?(scope) if scope
  end

  def default_rate
    object.post_votes.find_by(user: scope).try(:rate) if scope
  end

  def user_post
    object.owned_by?(scope) if scope
  end
end
