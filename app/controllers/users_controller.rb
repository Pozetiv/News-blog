class UsersController < ApplicationController


  def show
  @user = User.find(params[:id])
  end

  def new
  @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "Welcome your are new user "
      redirect_to @user

    else
      render 'new'
    end
  end

  def destroy

  end

  def update

  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confimation)
  end

  def search_post
    @user = User.find(params[:id])
  end
end
