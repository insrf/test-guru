class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy start update_inline]
  skip_before_action :verify_authenticity_token

  def index

  end

  def show

  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.created_tests.new(test_params)
    @test.timer = convert_time_to_integer

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def convert_time_to_integer
    if params[:timer_on] == "1"
     params["timer_params(4i)"].to_i * 3600 + params["timer_params(5i)"].to_i * 60
    end
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
