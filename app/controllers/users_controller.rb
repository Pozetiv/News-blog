class UsersController < ApplicationController
 def index

 end
 def new
   @users = User.new
 end
def create
@user = User.new(user_params)
  if @user.save
    redirect_to :show
    else :new
  end
end

def update

end

def show

end

def delete

end

end
