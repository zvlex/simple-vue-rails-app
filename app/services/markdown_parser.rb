class MarkdownParser
  attr_reader :markdown_data

  def initialize(markdown_data)
    @markdown_data = markdown_data
  end

  def renderer
    Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
  end

  def to_html
    white_list_sanitizer = Rails::Html::WhiteListSanitizer.new
    markdown = Redcarpet::Markdown.new(renderer).render(markdown_data)

    white_list_sanitizer.sanitize(markdown).html_safe
  end
end
