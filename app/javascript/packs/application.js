// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
import "channels"

import CodeMirror from "codemirror"
import "codemirror/mode/ruby/ruby.js";
import 'codemirror/addon/selection/mark-selection';

window.addEventListener("load", () => {
    const editor = document.querySelector("#editor");
    const result = document.querySelector("#result");

    const rfunc = function () {
	console.log("in rfunc");
	const Http = new XMLHttpRequest();
	const params = JSON.stringify({
	    code: window.Editor.getValue(),

	    inline_const_cache: document.querySelector('input[type=checkbox][name="inline_const_cache"').checked ? "true" : "false",
	    peephole_optimization: document.querySelector('input[type=checkbox][name="peephole_optimization"').checked ? "true" : "false",
	    tailcall_optimization: document.querySelector('input[type=checkbox][name="tailcall_optimization"').checked ? "true" : "false",
	    specialized_instruction: document.querySelector('input[type=checkbox][name="specialized_instruction"').checked ? "true" : "false",
	    operands_unification: document.querySelector('input[type=checkbox][name="operands_unification"').checked ? "true" : "false",
	    instructions_unification: document.querySelector('input[type=checkbox][name="instructions_unification"').checked ? "true" : "false",
	    stack_caching: document.querySelector('input[type=checkbox][name="stack_caching"').checked ? "true" : "false",
	    frozen_string_literal: document.querySelector('input[type=checkbox][name="frozen_string_literal"').checked ? "true" : "false",
	    debug_frozen_string_literal: document.querySelector('input[type=checkbox][name="debug_frozen_string_literal"').checked ? "true" : "false",
	    coverage_enabled: document.querySelector('input[type=checkbox][name="coverage_enabled"').checked ? "true" : "false"
	});

	Http.open("POST", "/explores");
	Http.setRequestHeader("X-CSRF-Token", document.head.querySelector('meta[name="csrf-token"]').content);
	Http.setRequestHeader("Content-type", "application/json; charset=utf-8");

	Http.send(params);

	Http.onreadystatechange = (e) => {
	    result.innerHTML = Http.responseText;
	}
    };

    document.querySelector('input[type=checkbox][name="inline_const_cache"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="peephole_optimization"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="tailcall_optimization"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="specialized_instruction"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="operands_unification"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="instructions_unification"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="stack_caching"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="frozen_string_literal"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="debug_frozen_string_literal"').addEventListener('change', rfunc);
    document.querySelector('input[type=checkbox][name="coverage_enabled"').addEventListener('change', rfunc);

    window.Editor = CodeMirror.fromTextArea(editor, {
        lineNumbers: true,
        mode: "ruby",
        indentUnit: 2
    });



    let timeout = null;
    window.Editor.on("update", () => {
    clearTimeout(timeout);

    // Make a new timeout set to go off in 1000ms (1 second)
    timeout = setTimeout(rfunc, 600);
    });
});

Rails.start()
Turbolinks.start()
// ActiveStorage.start()
