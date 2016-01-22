class MarkdownParser
  attr_reader :markdown_data

  def initialize(markdown_data)
    @markdown_data = markdown_data
  end

  def renderer
    Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
  end

  def to_html
    Redcarpet::Markdown.new(renderer).render(markdown_data).html_safe
  end
end
