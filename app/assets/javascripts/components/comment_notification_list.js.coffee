window.CommentNotificationList = Vue.extend(
  template: '#comment-notification-list-tpl'

  props: ['notifications']
)

Vue.component('comment-notification-list', window.CommentNotificationList)
