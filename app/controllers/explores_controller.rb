require 'ripper'

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
  # debug_level: 0
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
end

class ExploresController < ApplicationController
  # GET /explores or /explores.json
  def index
    @explore = Explore.new(params[:code], compiler_flag_params)
    @explore.analyze
  end

  # POST /explores or /explores.json
  def create
    @explore = Explore.new(params[:code], compiler_flag_params)
    if @explore.analyze
      render partial: "explore"
    else
      render partial: "error"
    end
  end

  private
    # Only allow a list of trusted parameters through.
  def compiler_flag_params
    flags = {}
    CONFIGURABLE_FLAGS.keys.each do |key|
      puts "#{key} -> #{params[key].inspect}"
      flags[key] = (params[key] == "true") ? true : false
    end
    flags
  end
end
