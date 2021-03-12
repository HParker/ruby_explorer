MOUSEOVER_SCRIPT = "(window.marker ? window.marker.clear() : ''); window.marker = window.Editor.markText({ line: %s, ch: %s }, { line: %s, ch: %s }, {className: \"highlighted\"})"

module ExploresHelper
  def format_lex_line(ll)
    content_tag(:span, class: "lex-line", onmouseover: MOUSEOVER_SCRIPT % [(ll[0][0] - 1), (ll[0][1]), (ll[0][0] - 1), (ll[0][1] + ll[2].size)]) do
      [content_tag(:strong, ll[1]),
      " \"#{ll[2].gsub("\n", "\\n")}\" #{ll[3]}\n"].join.html_safe
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
