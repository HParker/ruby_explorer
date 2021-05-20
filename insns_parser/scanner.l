%{
#include "parser.h"
#include "lang.h"
int comment_nesting = 0;
%}

%option reentrant
%option noyywrap
%option yylineno

%x C_CODE
%x COMMENT

%%

"DEFINE_INSN" { return DEFINITION; }
"DEFINE_INSN_IF(STACK_CACHING)" { return DEFINITION; }
"DEFINE_INSN_IF(SUPPORT_CALL_C_FUNCTION)" { return DEFINITION; }
"DEFINE_INSN_IF(SUPPORT_JOKE)" { return DEFINITION; }
[a-zA-Z][a-zA-Z_]* { return NAME; }
\( { return OPEN_PAREN; }
\) { return CLOSE_PAREN; }
[,] { return COMMA; }
"..." { return ELIPSE; }

\/\/.* // line comments

\{  { BEGIN(C_CODE); }
<C_CODE>{
  \} {
    if (comment_nesting) {
      --comment_nesting;
    } else {
      BEGIN(INITIAL);
    };
  }

  \{ {
    ++comment_nesting;
  }
  .
  \n
}

"/*" {
  BEGIN(COMMENT);
}
<COMMENT>{
  "*/" {
    if (comment_nesting) {
      --comment_nesting;
    } else {
      BEGIN(INITIAL);
    };
  }

  "/*" {
    ++comment_nesting;
  }
  .
  [^/*\n]+       ; /* Line 12 */
  \n             ; /* Line 14 */
}

.
\n

%%
