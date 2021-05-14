DEFAULT_PROGRAM = <<~RUBY
def foo(bar)
  bar * bar
end
RUBY

CONFIGURABLE_FLAGS = {
  inline_const_cache: true,
  peephole_optimization: true,
  tailcall_optimization: false,
  specialized_instruction: true,
  operands_unification: true,
  instructions_unification: false,
  stack_caching: false,
  frozen_string_literal: false,
  debug_frozen_string_literal: false,
  coverage_enabled: true,
  # debug_level: 0 # TODO: allow configuring debug level
}

class Explore
  attr_accessor :code, :error, :flags
  def initialize(code, compiler_flags = nil)
    @error = nil
    if code.nil?
      @code = DEFAULT_PROGRAM
    else
      @code = code
    end

    if compiler_flags.nil?
      @flags = CONFIGURABLE_FLAGS
    else
      @flags = compiler_flags
    end
  end

  def analyze
    @disassembly = RubyVM::InstructionSequence.compile(@code, **@flags).disassemble
    true
  rescue SyntaxError => er
    @error = er
    false
  end

  def sexp
    Ripper.sexp(@code)
  end

  def lex
    Ripper.lex(@code)
  end

  def instructions
    @disassembly
  end

  def to_h
    @flags.merge(code: @code)
  end

  def to_ruby
    "ruby --dump=insns -e '#{@code.gsub("\n", ";")}'"
  end
end
