class Admin::BagesController < Admin::BaseController
  before_action :find_bages, only: %i[index]
  before_action :find_bage, only: %i[show edit update destroy]

  def index
  end

  def show

  end

  def new
    @bage = Bage.new
  end

  def edit
  end

  def create
    @bage = Bage.new(bage_params)

    if @bage.save
      redirect_to [:admin, @bage], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @bage.update(bage_params)
      redirect_to [:admin, @bage]
    else
      render :new
    end
  end

  def destroy
    @bage.destroy
    redirect_to admin_bages_path
  end

  private

  def bage_params
    params.require(:bage).permit(:name, :url, :rule)
  end

  def find_bages
    @bages = Bage.all
  end

  def find_bage
    @bage = Bage.find(params[:id])
  end
end
