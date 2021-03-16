class DocsController < ApplicationController
  def show
    path = File.join(Rails.root, 'lib', 'docs', "#{params[:id]}.md")
    page = File.read(path)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true),
                                       autolink: true,
                                       fenced_code_blocks: true
                                      )
    render :html => markdown.render(page).html_safe
  end
end
