class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_test, only: %i[index show new edit destroy]

  def index
    set_test
  end 

  def show
    # byebug
    set_test
    @question = @test.questions.find(params[:id]) || record_not_found
  end

  def new
    set_test
    @question = @test.questions.find_by(id:params[:id])
  end	

  def create
    set_test
    @question = @test.questions.create(question_params)
    render plain: "Question create"
  end

  def destroy
    set_test
    @question = Question.find(params[:id]) || record_not_found
    @question.destroy
    render plain: "Test delete"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end  
end
