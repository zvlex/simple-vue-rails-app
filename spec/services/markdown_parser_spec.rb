require 'rails_helper'

describe MarkdownParser do
  it 'convers markdown tags to html' do
    md_title = '# title'
    expect(MarkdownParser.new(md_title).to_html.strip).to eq('<h1>title</h1>')
  end

  it 'wraps simple text to paragraph' do
    simple_text = 'hello'
    expect(MarkdownParser.new(simple_text).to_html.strip).to eq('<p>hello</p>')
  end

  it 'filters <script> tags' do
    script_tag = '<script>alert(1)</script>'
    expect(MarkdownParser.new(script_tag).to_html.strip).to eq('<p>alert(1)</p>')
  end
end

