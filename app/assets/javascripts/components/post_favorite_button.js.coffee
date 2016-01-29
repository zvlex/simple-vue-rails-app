window.PostFavoriteButton = Vue.extend(
  template: '#post-favorite-button-tpl'

  props:
    post:
      type: Object
      coerce: (val) ->
        JSON.parse(val)

  data: ->
    quantity:
      @post.favoritesQuantity
    isEmpty:
      @post.isEmpty

  methods:
    add_to_favorites: ->
      return unless gon.is_logged_in

      @$http.put(Zvample.add_to_favorites_posts_path(), {id: @post.id}).then (response) ->
        @$nextTick ->
          @isEmpty = response.data.status
          @quantity = response.data.quantity
)

Vue.component('post-favorite-button', window.PostFavoriteButton)
