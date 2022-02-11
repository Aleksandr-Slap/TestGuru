class FeedBackController < ApplicationController
  before_action :authenticate_user!

  def index; end 

  def create
    @user = current_user
    FeedBackMailer.create(params[:message], @user).deliver_now
    flash[:notice] = t(".success") 
    render :index
  end
end
