MOUSEOVER_SCRIPT = "(window.marker ? window.marker.clear() : ''); window.marker = window.Editor.markText({ line: %s, ch: %s }, { line: %s, ch: %s }, {className: \"highlighted\"})"

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
  "setclassvariable" => 244,
  "getconstant" => 260,
  "setconstant" => 273,
  "getglobal" => 290,
  "setglobal" => 301,
  "putnil" => 316,
  "putself" => 326,
  "putobject" => 338,
  "putspecialobject" => 348,
  "putstring" => 361,
  "concatstrings" => 371,
  "tostring" => 385,
  "toregexp" => 397,
  "intern" => 413,
  "newarray" => 423,
  "newarraykwsplat" => 438,
  "duparray" => 454,
  "duphash" => 465,
  "expandarray" => 484,
  "concatarray" => 496,
  "splatarray" => 507,
  "newhash" => 518,
  "newrange" => 536,
  "pop" => 552,
  "dup" => 563,
  "dupn" => 573,
  "swap" => 587,
  "reverse" => 597,
  "reput" => 616,
  "topn" => 627,
  "setn" => 638,
  "adjuststack" => 649,
  "defined" => 664,
  "checkmatch" => 681,
  "checkkeyword" => 692,
  "checktype" => 702,
  "defineclass" => 718,
  "definemethod" => 739,
  "definesmethod" => 748,
  "send" => 762,
  "opt_send_without_block" => 780,
  "opt_str_freeze" => 798,
  "opt_nil_p" => 813,
  "opt_str_uminus" => 826,
  "opt_newarray_max" => 840,
  "opt_newarray_min" => 855,
  "invokesuper" => 868,
  "invokeblock" => 886,
  "leave" => 905,
  "throw" => 941,
  "jump" => 959,
  "branchif" => 972,
  "branchunless" => 987,
  "branchnil" => 1002,
  "opt_getinlinecache" => 1021,
  "opt_setinlinecache" => 1038,
  "once" => 1048,
  "opt_case_dispatch" => 1058,
  "opt_plus" => 1075,
  "opt_minus" => 1089,
  "opt_mult" => 1103,
  "opt_div" => 1117,
  "opt_mod" => 1134,
  "opt_eq" => 1150,
  "opt_neq" => 1164,
  "opt_lt" => 1178,
  "opt_le" => 1192,
  "opt_gt" => 1206,
  "opt_ge" => 1220,
  "opt_ltlt" => 1234,
  "opt_and" => 1252,
  "opt_or" => 1266,
  "opt_aref" => 1280,
  "opt_aset" => 1299,
  "opt_aset_with" => 1316,
  "opt_aref_with" => 1339,
  "opt_length" => 1358,
  "opt_size" => 1372,
  "opt_empty_p" => 1386,
  "opt_succ" => 1400,
  "opt_not" => 1414,
  "opt_regexpmatch2" => 1428,
  "opt_call_c_function" => 1443,
  "invokebuiltin" => 1464,
  "opt_invokebuiltin_delegate" => 1476,
  "opt_invokebuiltin_delegate_leave" => 1487,
  "bitblt" => 1512,
  "answer" => 1522
}

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
  "getclassvariable" => "1 args (+1,-0)",
  "setclassvariable" => "1 args (+0,-1)",
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
  "tostring" => "0 args (+1,-2)",
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
  "answer" => "0 args (+1,-0)"
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
          [content_tag(:a, CGI::escapeHTML(word), href: "https://github.com/ruby/ruby/blob/ruby_3_0/insns.def#L#{INSTRUCTION_NAMES[normalized_word]}"),
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
