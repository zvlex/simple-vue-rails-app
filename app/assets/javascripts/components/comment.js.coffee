window.Comment = Vue.extend(
  props: ['comment']
  template: '<pre>{{ comment.id }} - {{ comment.body }}</pre>'
)

Vue.component('comment', window.Comment)
