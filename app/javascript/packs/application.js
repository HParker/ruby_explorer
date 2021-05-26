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
    window.Editor = CodeMirror.fromTextArea(editor, {
        lineNumbers: true,
        mode: "ruby",
        indentUnit: 2
    });
});

Rails.start()
Turbolinks.start()
// ActiveStorage.start()
