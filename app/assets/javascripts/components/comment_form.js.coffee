window.CommentForm = Vue.extend(
  template: '#comment-form-tpl'

  props:
    parentId:
      type: Number
      default: undefined

  data: ->
    body: "" # TODO: do NOT assign text field to undefined!!
    notifications: []
    loggedIn: gon.is_logged_in
    isUserBanned: gon.is_user_banned
    showRight: false

  methods:
    addComment: (e) ->
      if this.loggedIn and !this.isUserBanned
        @$dispatch('signal:addComment', @)
      else
        this.showRight = true
)

Vue.component('comment-form', window.CommentForm)
