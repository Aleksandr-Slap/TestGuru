class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_test, only: %i[index new create edit ]

  def index
    
  end 

  def show
    @question = Question.find(params[:id])
  end

  def new
    
  end	

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      render plain: "Question create"
    else
      render plain: "Incorrect data entered"
    end  
  end

  def destroy
    @question = Question.find(params[:id])
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
