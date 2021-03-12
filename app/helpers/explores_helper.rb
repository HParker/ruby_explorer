module ExploresHelper
  def format_lex(lex)
    content_tag(:ul) do
      lex.map do |ll|
        content_tag(:li, "#{ll[0][0]}-#{ll[0][1]} #{ll[1]} \"#{ll[2]}\" #{ll[3]}",
                    onmouseover: "(window.marker ? window.marker.clear() : ''); window.marker = window.Editor.markText({ line: #{ll[0][0] - 1}, ch: #{ll[0][1]}}, { line: #{ll[0][0] - 1}, ch: #{ll[0][1] + ll[2].size}}, {className: \"highlighted\"})")
      end.join.html_safe
    end
  end

  def format_sexp(sexp)
    if !sexp.is_a?(Array)
      content_tag(:summary, sexp)
    else
      content_tag(:details, open: true) do
        sexp.collect do |spart|
          if spart.is_a?(Array)
            format_sexp(spart)
          else
            content_tag(:li, spart.inspect)
          end
        end.join.html_safe
      end
    end
  end
end
