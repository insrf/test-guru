class QuestionsController < ApplicationController
  before_action :find_test , only: %i[index new create]
  before_action :find_question , only: %i[show edit update destroy]

  # def index
  #   @test.questions
  # end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
