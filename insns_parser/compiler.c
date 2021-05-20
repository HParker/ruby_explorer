#include <stdio.h>
#include "parser.h"
#include "scanner.h"
#include "lang.h"

void print_program(Program * prog) {
  for (int i = 0; i < prog->index; i++) {
    printf("## %s\n\n", prog->instructions[i].name);

    printf("- takes %i arguments: ", prog->instructions[i].arg_groups[0].size);
    for (int j = 0; j < prog->instructions[i].arg_groups[0].size; j++) {
      printf("`%s` ", prog->instructions[i].arg_groups[0].args[j]);
    }
    printf("\n");
    printf("- pops %i arguments: ", prog->instructions[i].arg_groups[1].size);
    for (int j = 0; j < prog->instructions[i].arg_groups[1].size; j++) {
      printf("`%s` ", prog->instructions[i].arg_groups[1].args[j]);
    }
    printf("\n");
    printf("- pushes %i arguments: ", prog->instructions[i].arg_groups[2].size);
    for (int j = 0; j < prog->instructions[i].arg_groups[2].size; j++) {
      printf("`%s` ", prog->instructions[i].arg_groups[2].args[j]);
    }
    printf("\n");
    printf("\n");
  }
}

void short_print(Program * prog) {
  printf("RUBY_STACK_INFO = {\n");
  for (int i = 0; i < prog->index; i++) {
    printf("  \"%s\" => \"%i args ", prog->instructions[i].name, prog->instructions[i].arg_groups[0].size);
    printf("(+%i,", prog->instructions[i].arg_groups[2].size);
    printf("-%i)\",\n", prog->instructions[i].arg_groups[1].size);
  }
  printf("}\n");
}

void* ParseAlloc(void* (*allocProc)(unsigned long));
void* ParseFree(void*, void(*freeProc)(void*));
void* Parse(void*, int lexCode, char * id, Program * data);

Program parseProgram(FILE * file) {
  // setup buffer
  Program prog;

  prog.index = 0;
  prog.instructions = malloc(sizeof(ProgramInstruction) * 300);

  // TODO: these stringgs might not be needed.
  for (int i = 0; i < 300; i++) {
    prog.instructions[i].name = malloc(sizeof(char) * 100);
    prog.instructions[i].size = 0;
    prog.instructions[i].arg_groups = malloc(sizeof(ProgramArgs) * 3);
    for (int j = 0; j < 3; j++) {
      prog.instructions[i].arg_groups[j].size = 0;
      prog.instructions[i].arg_groups[j].args = malloc(sizeof(char*) * 10);
      for (int k = 0; k < 10; k++) {
        prog.instructions[i].arg_groups[j].args[k] = malloc(sizeof(char) * 100);
      }
    }
  }

  yyscan_t scanner;
  yylex_init(&scanner);
  // setup scanner for stdin
  /* yyset_in(stdin, scanner); */

  // setup scanner for a file
  yyset_in(file, scanner);

  // setup parser
  void* parser = ParseAlloc(malloc);

  int lexCode;
  char * tk = malloc(sizeof(char) * 100);
  do  {
    lexCode = yylex(scanner);
    strcpy(tk, yyget_text(scanner));
    /* printf("lexing '%s' at (%i,%i)\n", tk, yyget_lineno(scanner), yyget_column(scanner)); */
    Parse(parser, lexCode, tk, &prog);

    tk = malloc(sizeof(char) * 100);
   } while (lexCode > 0);
  return prog;
}
