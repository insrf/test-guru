class BagesController < ApplicationController
  before_action :find_bages, only: %i[index]

  def index
  end

  private

  def find_bages
    @bages = Bage.all
  end

end
