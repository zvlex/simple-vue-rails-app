window.CommentBox = Vue.extend(
  template: '#comment-box-tpl'
  props: ['commentNodes']
  data: ->
    comments: JSON.parse(this.commentNodes)
  events:
    'signal:addComment': (child) ->
      self = this

      $.ajax(
        data: child.form_data
        url: '/comments' #TODO: install js-routes
        type: 'POST'

        success: (data) ->
          self.comments = data

        error: (data) ->
          console.error('fiuck')
      )

      child.$set('body', undefined)
)

Vue.component('comment-box', window.CommentBox)
