class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalide date username or password'
      
    end
  end

  def destroy
  end
end
