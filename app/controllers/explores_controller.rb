require 'ripper'

class ExploresController < ApplicationController
  # GET /explores or /explores.json
  def index
    @explore = Explore.new(compile_params[:code], compiler_flag_params)
    @explore.analyze
  end

  # POST /explores or /explores.json
  def create
    @explore = Explore.new(compile_params[:code], compiler_flag_params)
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
    flags_configured = false
    CONFIGURABLE_FLAGS.keys.each do |key|
      flags[key] = (compile_params[key] == "true") ? true : false

      if !compile_params[key].nil?
        flags_configured = true
      end

      if !compile_params[key].nil?
        flags_configured = true
      end
    end
    if flags_configured
      flags
    else
      CONFIGURABLE_FLAGS
    end
  end

  def compile_params
    params.permit(:code, :authenticity_token, :commit, *CONFIGURABLE_FLAGS.keys)
  end
end
