window.Comment = Vue.extend(
  template: '#comment-tpl'

  props:
    comment:
      type: Object
      required: true

  data: ->
    replied: false

  methods:
    showForm: ->
      @replied = !@replied

  events:
    'signal:hideForm': ->
      @replied = false
)

Vue.component('comment', window.Comment)
