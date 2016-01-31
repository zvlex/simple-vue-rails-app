window.PostRatingButtons = Vue.extend(
  template: '#post-rating-buttons-tpl'

  props:
    post:
      type: Object
      coerce: (val) ->
        JSON.parse(val)

  data: ->
    quantity:
      @post.votesQuantity

    isVoted:
      @post.isVoted

    defaultRate:
      @post.defaultRate

    userPost:
      @post.userPost

    ratesMap:
      {
        '-1': 'minus',
        '0': 'eye-open',
        '1': 'plus'
      }

  methods:
    vote: (rate) ->
      return if @post.userPost

      params = { id: @post.id, rate: rate }

      @$http.put(Zvample.vote_posts_path(), params).then (response) ->
        if gon.is_logged_in
          @$nextTick ->
            @quantity = response.data.quantity
            @isVoted = true
            @defaultRate = rate

            root_vue.notify(response.data)
)

Vue.component('post-rating-buttons', window.PostRatingButtons)
