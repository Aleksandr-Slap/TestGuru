class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  skip_before_action :verify_authenticity_token

  before_action :set_test, only: %i[ index new create edit ]

  before_action :set_question, only: %i[ show destroy ]

  def index
    
  end 

  def show
    
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

  def set_question
    @question = Question.find(params[:id])
  end 

  def record_not_found
      render plain: "404 No question found", status: 404
    end 
end
