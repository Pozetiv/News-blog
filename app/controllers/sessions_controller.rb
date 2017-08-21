class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_blank_or user
    else
      flash.now[:danger] = 'Invalide date username or password'
      render 'new' 
      
    end
  end
  

  def destroy
    logout
    redirect_to root_url
  end
end
