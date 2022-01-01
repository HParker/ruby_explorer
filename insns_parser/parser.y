%include {
#include <stdio.h>
#include <string.h>
#include "lang.h"
}

%token_type {const char*}
%extra_argument { Program *prog }

// TODO: it is annoying I have to do this
// apparently `commands command` won't reduce ever,
// so this is effectively a instruction limit.
%stack_size 80000

%syntax_error
{
    fprintf(stderr, "Error parsing instruction\n");
}

program ::= instructions.
instructions ::= instructions instruction.
instructions ::= instruction.
instruction ::= DEFINITION name(INSTR_NAME) args args args. { strcpy(prog->instructions[prog->index].name, INSTR_NAME); prog->index++; }

name(N) ::= NAME(I). { N = I; prog->instructions[prog->index].line = prog->cur_line; }

args ::= OPEN_PAREN arguments CLOSE_PAREN. { prog->instructions[prog->index].size++; }
arguments ::= arguments COMMA argument.
arguments ::= argument.
arguments ::= .

argument ::= ELIPSE. { strcpy(prog->instructions[prog->index].arg_groups[prog->instructions[prog->index].size].args[prog->instructions[prog->index].arg_groups[prog->instructions[prog->index].size].size++], "..."); }
argument ::= NAME NAME(arg_name). { strcpy(prog->instructions[prog->index].arg_groups[prog->instructions[prog->index].size].args[prog->instructions[prog->index].arg_groups[prog->instructions[prog->index].size].size++], arg_name); }
