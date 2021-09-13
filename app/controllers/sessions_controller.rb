class SessionsController < ApplicationController

  def index
    session.delete(:user_id)
    redirect_to login_path
  end 

  def new
  
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password]) && cookies[:origin_url] == "/tests"
      session[:user_id] = user.id
      redirect_to tests_path 
    elsif cookies[:origin_url] != "/tests"
      session[:user_id] = user.id
      redirect_to cookies[:origin_url]  
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end  
  end 

end