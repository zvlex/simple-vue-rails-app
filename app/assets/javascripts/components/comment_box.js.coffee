window.CommentBox = Vue.extend(
  template: '#comment-box-tpl'

  props:
    commentNodes:
      type: String
      require: true
    postId:
      type: String
      required: true

  data: ->
    comments: JSON.parse(this.commentNodes)

  events:
    'signal:addComment': (child) ->
      self = this

      $.ajax(
        data: child.form_data
        url: Zvample.comments_path()
        type: 'POST'

        success: (data) ->
          self.comments = data
          child.$set('body', undefined)

        error: (data) ->
          console.error('Some error :(')
      )
)

Vue.component('comment-box', window.CommentBox)
