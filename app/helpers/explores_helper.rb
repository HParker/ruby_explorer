MOUSEOVER_SCRIPT = "(window.marker ? window.marker.clear() : ''); window.marker = window.Editor.markText({ line: %s, ch: %s }, { line: %s, ch: %s }, {className: \"highlighted\"})"

RUBY_STACK_INFO = {
  "nop" => "0 args (+0,-0)",
  "getlocal" => "2 args (+1,-0)",
  "setlocal" => "2 args (+0,-1)",
  "getblockparam" => "2 args (+1,-0)",
  "setblockparam" => "2 args (+0,-1)",
  "getblockparamproxy" => "2 args (+1,-0)",
  "getspecial" => "2 args (+1,-0)",
  "setspecial" => "1 args (+0,-1)",
  "getinstancevariable" => "2 args (+1,-0)",
  "setinstancevariable" => "2 args (+0,-1)",
  "getclassvariable" => "2 args (+1,-0)",
  "setclassvariable" => "2 args (+0,-1)",
  "getconstant" => "1 args (+1,-2)",
  "setconstant" => "1 args (+0,-2)",
  "getglobal" => "1 args (+1,-0)",
  "setglobal" => "1 args (+0,-1)",
  "putnil" => "0 args (+1,-0)",
  "putself" => "0 args (+1,-0)",
  "putobject" => "1 args (+1,-0)",
  "putspecialobject" => "1 args (+1,-0)",
  "putstring" => "1 args (+1,-0)",
  "concatstrings" => "1 args (+1,-1)",
  "anytostring" => "0 args (+1,-2)",
  "toregexp" => "2 args (+1,-1)",
  "intern" => "0 args (+1,-1)",
  "newarray" => "1 args (+1,-1)",
  "newarraykwsplat" => "1 args (+1,-1)",
  "duparray" => "1 args (+1,-0)",
  "duphash" => "1 args (+1,-0)",
  "expandarray" => "2 args (+1,-2)",
  "concatarray" => "0 args (+1,-2)",
  "splatarray" => "1 args (+1,-1)",
  "newhash" => "1 args (+1,-1)",
  "newrange" => "1 args (+1,-2)",
  "pop" => "0 args (+0,-1)",
  "dup" => "0 args (+2,-1)",
  "dupn" => "1 args (+1,-1)",
  "swap" => "0 args (+2,-2)",
  "reput" => "0 args (+1,-2)",
  "topn" => "1 args (+1,-1)",
  "setn" => "1 args (+1,-2)",
  "adjuststack" => "1 args (+1,-1)",
  "defined" => "3 args (+1,-1)",
  "checkmatch" => "1 args (+1,-2)",
  "checkkeyword" => "2 args (+1,-0)",
  "checktype" => "1 args (+1,-1)",
  "defineclass" => "3 args (+1,-2)",
  "definemethod" => "2 args (+0,-0)",
  "definesmethod" => "2 args (+0,-1)",
  "send" => "2 args (+1,-1)",
  "opt_send_without_block" => "1 args (+1,-1)",
  "objtostring" => "1 args (+1,-1)",
  "opt_str_freeze" => "2 args (+1,-0)",
  "opt_nil_p" => "1 args (+1,-1)",
  "opt_str_uminus" => "2 args (+1,-0)",
  "opt_newarray_max" => "1 args (+1,-1)",
  "opt_newarray_min" => "1 args (+1,-1)",
  "invokesuper" => "2 args (+1,-1)",
  "invokeblock" => "1 args (+1,-1)",
  "leave" => "0 args (+1,-1)",
  "throw" => "1 args (+1,-1)",
  "jump" => "1 args (+0,-0)",
  "branchif" => "1 args (+0,-1)",
  "branchunless" => "1 args (+0,-1)",
  "branchnil" => "1 args (+0,-1)",
  "opt_getinlinecache" => "2 args (+1,-0)",
  "opt_setinlinecache" => "1 args (+1,-1)",
  "once" => "2 args (+1,-0)",
  "opt_case_dispatch" => "2 args (+0,-2)",
  "opt_plus" => "1 args (+1,-2)",
  "opt_minus" => "1 args (+1,-2)",
  "opt_mult" => "1 args (+1,-2)",
  "opt_div" => "1 args (+1,-2)",
  "opt_mod" => "1 args (+1,-2)",
  "opt_eq" => "1 args (+1,-2)",
  "opt_neq" => "2 args (+1,-2)",
  "opt_lt" => "1 args (+1,-2)",
  "opt_le" => "1 args (+1,-2)",
  "opt_gt" => "1 args (+1,-2)",
  "opt_ge" => "1 args (+1,-2)",
  "opt_ltlt" => "1 args (+1,-2)",
  "opt_and" => "1 args (+1,-2)",
  "opt_or" => "1 args (+1,-2)",
  "opt_aref" => "1 args (+1,-2)",
  "opt_aset" => "1 args (+1,-3)",
  "opt_aset_with" => "2 args (+1,-2)",
  "opt_aref_with" => "2 args (+1,-1)",
  "opt_length" => "1 args (+1,-1)",
  "opt_size" => "1 args (+1,-1)",
  "opt_empty_p" => "1 args (+1,-1)",
  "opt_succ" => "1 args (+1,-1)",
  "opt_not" => "1 args (+1,-1)",
  "opt_regexpmatch" => "1 args (+1,-2)",
  "opt_call_c_function" => "1 args (+0,-0)",
  "invokebuiltin" => "1 args (+1,-1)",
  "opt_invokebuiltin_delegate" => "2 args (+1,-0)",
  "opt_invokebuiltin_delegate_leave" => "2 args (+1,-0)",
  "bitblt" => "0 args (+1,-0)",
  "answer" => "0 args (+1,-0)",
}

INSTRUCTION_NAMES = {
  "nop" => 61,
  "getlocal" => 77,
  "setlocal" => 91,
  "getblockparam" => 103,
  "setblockparam" => 125,
  "getblockparamproxy" => 144,
  "getspecial" => 187,
  "setspecial" => 199,
  "getinstancevariable" => 209,
  "setinstancevariable" => 221,
  "getclassvariable" => 232,
  "setclassvariable" => 245,
  "getconstant" => 261,
  "setconstant" => 274,
  "getglobal" => 291,
  "setglobal" => 302,
  "putnil" => 317,
  "putself" => 327,
  "putobject" => 339,
  "putspecialobject" => 349,
  "putstring" => 363,
  "concatstrings" => 373,
  "anytostring" => 388,
  "toregexp" => 400,
  "intern" => 416,
  "newarray" => 426,
  "newarraykwsplat" => 441,
  "duparray" => 457,
  "duphash" => 468,
  "expandarray" => 487,
  "concatarray" => 499,
  "splatarray" => 510,
  "newhash" => 521,
  "newrange" => 541,
  "pop" => 557,
  "dup" => 568,
  "dupn" => 578,
  "swap" => 592,
  "reput" => 602,
  "topn" => 613,
  "setn" => 624,
  "adjuststack" => 635,
  "defined" => 650,
  "checkmatch" => 670,
  "checkkeyword" => 681,
  "checktype" => 691,
  "defineclass" => 707,
  "definemethod" => 728,
  "definesmethod" => 737,
  "send" => 751,
  "opt_send_without_block" => 769,
  "objtostring" => 788,
  "opt_str_freeze" => 802,
  "opt_nil_p" => 817,
  "opt_str_uminus" => 830,
  "opt_newarray_max" => 844,
  "opt_newarray_min" => 859,
  "invokesuper" => 872,
  "invokeblock" => 890,
  "leave" => 909,
  "throw" => 945,
  "jump" => 963,
  "branchif" => 976,
  "branchunless" => 991,
  "branchnil" => 1006,
  "opt_getinlinecache" => 1025,
  "opt_setinlinecache" => 1042,
  "once" => 1053,
  "opt_case_dispatch" => 1063,
  "opt_plus" => 1080,
  "opt_minus" => 1094,
  "opt_mult" => 1108,
  "opt_div" => 1122,
  "opt_mod" => 1139,
  "opt_eq" => 1155,
  "opt_neq" => 1169,
  "opt_lt" => 1183,
  "opt_le" => 1197,
  "opt_gt" => 1211,
  "opt_ge" => 1225,
  "opt_ltlt" => 1239,
  "opt_and" => 1257,
  "opt_or" => 1271,
  "opt_aref" => 1285,
  "opt_aset" => 1304,
  "opt_aset_with" => 1321,
  "opt_aref_with" => 1344,
  "opt_length" => 1363,
  "opt_size" => 1377,
  "opt_empty_p" => 1391,
  "opt_succ" => 1405,
  "opt_not" => 1419,
  "opt_regexpmatch" => 1433,
  "opt_call_c_function" => 1448,
  "invokebuiltin" => 1469,
  "opt_invokebuiltin_delegate" => 1481,
  "opt_invokebuiltin_delegate_leave" => 1492,
  "bitblt" => 1517,
  "answer" => 1527,
}

module ExploresHelper
  def format_lex_line(ll)
    content_tag(:span, class: "lex-line", onmouseover: MOUSEOVER_SCRIPT % [(ll[0][0] - 1), (ll[0][1]), (ll[0][0] - 1), (ll[0][1] + ll[2].size)]) do
      [content_tag(:strong, ll[1]),
       " \"#{ll[2].gsub("\n", "\\n")}\" #{ll[3]}\n"].join.html_safe
    end
  end

  def normalize_word(word)
    word.sub("_WC_0", "")
  end

  def stack_info(word)
    if RUBY_STACK_INFO[word]
      RUBY_STACK_INFO[word]
    elsif word.ends_with?("_WC_0")
      "1 args #{RUBY_STACK_INFO[normalize_word(word)].split(" ").last}"
    end
  end

  def format_instruction_line(il)
    il.split.map do |word|
      normalized_word = normalize_word(word)
      if INSTRUCTION_NAMES[normalized_word]
        content_tag(:div, class: "tooltip") do
          [content_tag(:a, CGI::escapeHTML(word), href: "https://github.com/ruby/ruby/blob/ruby_3_1/insns.def#L#{INSTRUCTION_NAMES[normalized_word]}"),
           content_tag(:span, stack_info(word), class: "tooltiptext")].join.html_safe
        end.html_safe
      else
        CGI::escapeHTML(word)
      end
    end.join(" ").concat("\n").html_safe
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
