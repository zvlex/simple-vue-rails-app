window.CommentBox = Vue.extend(
  template: '#comment-box-tpl'

  props:
    postId:
      type: String
      required: true

  data: ->
    comments: []

  computed:
    postCommentsUrl: ->
      Zvample.post_comments_path(@postId)

    commentsQuantity: ->
      @comments.length

  ready: ->
    @$http.get(@postCommentsUrl).then (response) ->
      @comments = response.data

  events:
    'signal:addComment': (child) ->
      formData = { comment: { body: child.body, parent_id: child.parentId } }

      @$http.post(@postCommentsUrl, formData).then (response) ->
        @$nextTick ->
          switch response.data.status
            when 422
              child.$set('notifications', response.data.errors)
            else
              @comments = response.data
              child.$set('body', undefined)
              @$broadcast('signal:hideForm')
)

Vue.component('comment-box', window.CommentBox)
