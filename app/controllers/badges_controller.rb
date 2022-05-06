class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @user_badges = current_user.badges
  end 

  def show
    @badge = Badge.find(params[:id])
  end

  def new
    @badge = Badge.new
  end 

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to badge_path(@badge)
    else
      render :new
    end  
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :rule_name, :rule_value)
  end  
end
