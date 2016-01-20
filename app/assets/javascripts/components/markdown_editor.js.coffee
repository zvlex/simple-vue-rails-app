window.MarkdownEditor = Vue.extend(
  template: '#markdown-editor-tpl'

  data: ->
    body: ''
    html_data: undefined

  methods:
    preview: ->
      @$http.get('preview', { body: @body }).then (response) =>
        console.log(response.data)
        @html_data = response.data
)

Vue.component('markdown-editor', window.MarkdownEditor)
