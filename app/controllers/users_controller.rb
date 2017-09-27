class UsersController < ApplicationController
 before_action :search_user, only: [:show, :update, :edit]
 before_action :logged_in_user, only: [:edit, :update]
 before_action :correct_user, only: [:edit, :update]

 def index
   @users = User.paginate(page: params[:page])
 end

  def show

  end

  def new
  @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = "Welcome your are new user "
      redirect_to @user

    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
    else
      render 'edit'
    end

  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confimation)
  end

  def search_user
    @user = User.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
    flash[:info] = "Please log in"
    redirect_to login_url
    end
  end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
