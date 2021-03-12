require 'ripper'

class Explore
  attr_accessor :code
  def initialize(code)
    @code = code || ""
  end

  def analyse
    true
  end

  def sexp
    Ripper.sexp(@code)
  end

  def lex
    Ripper.lex(@code)
  end

  def instructions
    RubyVM::InstructionSequence.compile(@code).disassemble
  end
end

class ExploresController < ApplicationController
  # GET /explores or /explores.json
  def index
    @explore = Explore.new(params[:code])

    if params[:code]
      @explore.code = params[:code]
    end
  end

  # GET /explores/1 or /explores/1.json
  def show
  end

  # GET /explores/new
  def new
  end

  # GET /explores/1/edit
  def edit
  end

  # POST /explores or /explores.json
  def create
    @explore = Explore.new(params[:code])
    render :show
  end

  # PATCH/PUT /explores/1 or /explores/1.json
  def update
    # respond_to do |format|
    #   if @explore.update(explore_params)
    #     format.html { redirect_to @explore, notice: "Explore was successfully updated." }
    #     format.json { render :show, status: :ok, location: @explore }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @explore.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /explores/1 or /explores/1.json
  def destroy
    # @explore.destroy
    # respond_to do |format|
    #   format.html { redirect_to explores_url, notice: "Explore was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Only allow a list of trusted parameters through.
    def explore_params
      params.fetch(:explore, {})
    end
end
