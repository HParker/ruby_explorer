#include <stdio.h>
#include "lang.h"

int seekr(Program * prog, int index, Instruction target) {
  int targetsNeeded = 1;
  int i = index;
  while (targetsNeeded > 0) {
    i++;
    if (prog->content[i] == target) {
      targetsNeeded--;
    }

    if (prog->content[i] == INSTR_OPEN_PAREN) {
      targetsNeeded++;
    }
  }
  return i;
}

int seekl(Program * prog, int index, Instruction target) {
  int targetsNeeded = 1;
  int i = index;
  while (targetsNeeded > 0) {
    i--;
    if (prog->content[i] == target) {
      targetsNeeded--;
    }

    if (prog->content[i] == INSTR_CLOSE_PAREN) {
      targetsNeeded++;
    }
  }
  return i;
}

int step(Program * prog, Runtime * rt) {
  if (rt->program_index >= prog->index) {
    return 1;
  }

  switch (prog->content[rt->program_index]) {
  case INSTR_LEFT:
    rt->memory_index--;
    break;
  case INSTR_RIGHT:
    rt->memory_index++;
    break;
  case INSTR_PRINT:
    print(rt->memory[rt->memory_index]);
    break;
  case INSTR_INCREMENT:
    rt->memory[rt->memory_index]++;
    break;
  case INSTR_DECREMENT:
    rt->memory[rt->memory_index]--;
    break;
  case INSTR_OPEN_PAREN:
    if (rt->memory[rt->memory_index] == 0) {
      rt->program_index = seekr(prog, rt->program_index, INSTR_CLOSE_PAREN);
    }
    break;
  case INSTR_CLOSE_PAREN:
    if (rt->memory[rt->memory_index] != 0) {
      rt->program_index = seekl(prog, rt->program_index, INSTR_OPEN_PAREN);
    }
    break;
  }
  rt->program_index++;
  return 0;
}
