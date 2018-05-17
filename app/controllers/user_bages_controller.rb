class UserBagesController < ApplicationController

  before_action :find_badge, only: %i[show]
  before_action :find_badges, only: %i[index]

  def index

  end

  private

  def find_badges
    @user_bages = UserBage.where(user_id: current_user.id)
  end
end
