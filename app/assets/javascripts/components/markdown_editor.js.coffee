window.MarkdownEditor = Vue.extend(
  template: '#markdown-editor-tpl'

  data: ->
    body: ''
    html_data: undefined

  methods:
    preview: ->
      @$http.post(Zvample.preview_posts_path(), { body: @body }).then (response) =>
        @html_data = response.data
)

Vue.component('markdown-editor', window.MarkdownEditor)
