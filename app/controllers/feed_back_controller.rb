class FeedBackController < ApplicationController
  before_action :authenticate_user!

  def new; end 

  def create
    FeedBackMailer.create(params[:message], current_user).deliver_now
    flash[:notice] = t(".success") 
    render :new
  end
end
