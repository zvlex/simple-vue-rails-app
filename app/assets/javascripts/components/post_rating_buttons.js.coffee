window.PostRatingButtons = Vue.extend(
  template: '#post-rating-buttons-tpl'

  props:
    post:
      type: Object
      coerce: (val) ->
        JSON.parse(val)

  data: ->
    quantity: 0
    isVoted: false

  methods:
    vote: (rate) ->
      # TODO: show notifications
      return if @isVoted

      params = { id: @post.id, rate: rate }

      @$http.put(Zvample.vote_posts_path(), params).then (response) ->
        @quantity = response.data.quantity
        @isVoted = true
)

Vue.component('post-rating-buttons', window.PostRatingButtons)
