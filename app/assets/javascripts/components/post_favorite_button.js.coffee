window.PostFavoriteButton = Vue.extend(
  template: '#post-favorite-button-tpl'

  props:
    postId:
      type: String
      required: true

    quantity:
      type: String
      required: true

    isEmpty:
      type: Boolean
      required: true

  methods:
    add_to_favorites: ->
      @$http.put(Zvample.add_to_favorites_posts_path(), {id: @postId}).then (response) ->
        @isEmpty = response.data.status
        @quantity = response.data.quantity
)

Vue.component('post-favorite-button', window.PostFavoriteButton)
