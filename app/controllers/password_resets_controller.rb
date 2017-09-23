class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email send with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email adress not found"
      render 'new'
    end
  end
end