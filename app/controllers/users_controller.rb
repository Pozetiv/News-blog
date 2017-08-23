class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

 def index
@user = User.all
 end
 
 def new
   @user = User.new
 end

 def edit
   @user = User.find(params[:id])
 end

def create
@user = User.new(user_params)
  if @user.save
    log_in @user
    flash[:success]  = "Thank you for registrate @user.name" #FIX THIS
    redirect_to @user
    else render 'new'
  end
end

def update
@user = User.find(params[:id])
if @user.update_attributes(user_params)
	redirect_to @user
else 
	render 'edite'
end
end

def show
 @user = User.find(params[:id])
end

def destroy
 User.find(params[:id]).destroy
flash[:success] = "User delete"
redirect_to user_url
end

 private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'PLEASE LOG IN'
      redirect_to singin_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
