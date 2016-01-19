window.CommentList = Vue.extend(
  template: '#comment-list-tpl'

  data: ->
    maxCommentDepth: 5

  props: ['comments']
)

Vue.component('comment-list', window.CommentList)
