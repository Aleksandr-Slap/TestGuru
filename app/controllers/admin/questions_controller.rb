# frozen_string_literal: true


class Admin::QuestionsController < Admin::BaseController
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  skip_before_action :verify_authenticity_token

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show edit update destroy]

  def show; end

  def new
    @question = @test.questions.build
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
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
    render plain: '404 No question found', status: 404
  end
end

