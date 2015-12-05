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
      this.replied = !this.replied

)

Vue.component('comment', window.Comment)
