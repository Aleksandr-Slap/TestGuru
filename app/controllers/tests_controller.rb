class TestsController < ApplicationController
  def index
    # byebug

    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end  

  def show
    redirect_to root_path
  end

  def new

  end

  def create
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end  
end
