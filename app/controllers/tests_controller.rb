class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @questions = Question.where(test_id: params[:id])
  end
end
