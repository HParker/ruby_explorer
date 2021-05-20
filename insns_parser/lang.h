#ifndef LANG
#define LANG

typedef enum Instruction {
  INSTR_DEFINITION,
  INSTR_NAME,
  INSTR_OPEN_PAREN,
  INSTR_CLOSE_PAREN,
  INSTR_COMMA,
  INSTR_ELIPSE
} Instruction;

typedef struct ProgramArgs {
  int size;
  char ** args;
} ProgramArgs;

typedef struct ProgramInstruction {
  char * name;
  int size;
  ProgramArgs * arg_groups;
} ProgramInstruction;

typedef struct Program {
  int index;
  ProgramInstruction * instructions;
} Program;

/* typedef struct Program { */
/*   Instruction * content; */
/*   int index; */
/*   int size; */
/* } Program; */

typedef struct Runtime {
  unsigned int program_index;
  unsigned int memory_index;
  unsigned int memory_size;
  char * memory;
} Runtime;

// compiler
extern void print_program(Program * prog);
extern const char instructionChar(Instruction instr);
extern char* instructionString(Instruction instr);
extern void print_instruction(Instruction instr);
extern void short_print(Program * prog);
extern Program parseProgram(FILE * file);

// VM
extern int step(Program * prog, Runtime * rt);
extern void print(char mem);
#endif
