class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    render plain: Test.pluck('title').join("\n")
  end

  def show
    render plain: @test.title
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
