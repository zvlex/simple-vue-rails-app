window.CommentList = Vue.extend(
  template: '#comment-list-tpl'

  props: ['comments']
)

Vue.component('comment-list', window.CommentList)
