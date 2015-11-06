window.Comment = Vue.extend(
  template: '#comment-tpl'

  props:
    comment:
      type: Object
      required: true
)

Vue.component('comment', window.Comment)
