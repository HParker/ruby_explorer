#include <stdio.h>
#include "parser.h"
#include "scanner.h"
#include "lang.h"

void print(char mem) {
  printf("%c", mem);
}

int main(int argc, char ** argv) {
  FILE * file;
  if (argc > 1) {
    file = fopen(argv[1], "r");
    if (!file) {
      fprintf(stderr, "could not open %s\n", argv[1]);
      return 1;
    }
  } else {
    fprintf(stderr, "Please provide a file\n");
    return 1;
  }

  Program prog = parseProgram(file);

  short_print(&prog);
  return 0;
}
