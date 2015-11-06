window.CommentForm = Vue.extend(
  template: '#comment-form-tpl'

  props: ['postId']

  data: ->
    body: undefined
    form_data: undefined

  methods:
    addComment: (e) ->
      @form_data = $(e.target).serialize()
      @$dispatch('signal:addComment', @)
)

Vue.component('comment-form', window.CommentForm)
