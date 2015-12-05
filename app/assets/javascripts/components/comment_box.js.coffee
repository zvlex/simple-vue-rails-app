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
      Zvample.post_comments_path(this.postId)

  ready: ->
    @$http.get @postCommentsUrl, (comments) ->
      @comments = comments

  events:
    'signal:addComment': (child) ->
      formData = { comment: { body: child.body, parent_id: child.parentId } }

      this.$http.post(@postCommentsUrl, formData, (data, status) =>
        Vue.nextTick =>
          @comments = data
          child.$set('body', undefined)
      ).error (data) =>
          switch data.status
            when 422
              child.$set('notifications', data.responseJSON.errors)
)

Vue.component('comment-box', window.CommentBox)
