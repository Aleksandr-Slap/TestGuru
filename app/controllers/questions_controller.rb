class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def index
    test = Test.find(params[:test_id])
    render plain: [test.questions]
  end 

  def show
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])
    byebug
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.find_by(id:params[:id])
  end	

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.create(question_params)
    redirect_to test_path(@test)
  end

  def destroy
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end	
end
