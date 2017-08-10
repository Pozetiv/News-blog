class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:id])
    if user && user.authenticate(params[:id])
    else
      flash[:error] = 'Invalide date username or password'
      render 'new'
    end
  end

  def destroy
  end
end
