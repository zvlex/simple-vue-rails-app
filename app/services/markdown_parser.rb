class MarkdownParser
  attr_reader :body

  def initialize(body)
    @body = body
  end

  def renderer
    Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
  end

  def convert_to_html
    Redcarpet::Markdown.new(renderer).render(body).html_safe
  end
end
