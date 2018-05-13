class Admin::UserBagesController < Admin::BaseController
  before_action :find_userbages, only: %i[index]
  before_action :find_userbage, only: %i[show edit update destroy]

  def index

  end

  def show

  end

  def new
    @user_bage = UserBage.new
  end

  def edit
  end

  def create
    @user_bage = UserBage.new(user_bage_params)

    if @user_bage.save
      redirect_to [:admin, @user_bage], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @user_bage.update(bage_params)
      redirect_to [:admin, @user_bage]
    else
      render :new
    end
  end

  def destroy
    @user_bage.destroy
    redirect_to admin_user_bages_path
  end

  private

  def user_bage_params
    params.require(:user_bage).permit(:user_id, :bage_id)
  end

  def find_userbages
    @user_bages = UserBage.all
  end

  def find_userbage
    @user_bage = UserBage.find(params[:id])
  end
end
