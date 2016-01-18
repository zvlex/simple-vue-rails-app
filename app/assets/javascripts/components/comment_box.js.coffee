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

  ready: ->
    @$http.get(@postCommentsUrl).then (response) ->
      @comments = response.data

  events:
    'signal:addComment': (child) ->
      formData = { comment: { body: child.body, parent_id: child.parentId } }

      @$http.post(@postCommentsUrl, formData).then ((response) =>
        Vue.nextTick =>
          @comments = response.data

          child.$set('body', undefined)

          @$broadcast('signal:hideForm')
      ), (response) =>
          switch response.status
            when 422
              child.$set('notifications', response.data.errors)
)

Vue.component('comment-box', window.CommentBox)
