class UsersController < ApplicationController
 def index
@user = User.all
 end
 
 def new
   @user = User.new
 end

 def edite
   @user = User.find(params[:id])
 end

def create
@user = User.new(user_params)
  if @user.save
    redirect_to @user
    flash[:success]  = "Welcome @user.name"
    else render 'new'
  end
end

def update
@user = User.find(params[:id])
if @user.update(user_params)
	redirect_to @user
else 
	render 'edite'
end
end

def show
 @user = User.find(params[:id])
end

def destroy
@user = User.find(params[:id])
@user.destroy
render :new
end

 private
  def user_params
    params.require(:user).permite(:username, :password, :email)
  end
end