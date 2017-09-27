class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new, :edit, :destroy, :update]


  before_action :search_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if admin
    @post.save
      redirect_to @post, success: 'Your create new post'
    else
      render :new, warning: 'Opps we have got some problems'
    end
  end

  def edit

  end

  def update
    if  admin
    @post.update_attributes(post_params)
      redirect_to @post, success: 'ALL OK, your update post '
    else
      render :edit, warning: 'Opps we have got some problems'
    end
  end

  def destroy
    if admin
    @post.destroy
    redirect_to post_path
    else
      redirect_to root_url
      flash.now[:info] = "You adre not admin"
      end
  end




  private

  def post_params
      params.require(:post).permit(:title, :body, :image)
  end

  def search_post
    @post = Post.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:info] = "Please log in"
      redirect_to login_url
    end
  end

  def admin
    redirect_to(root_url) unless current.user.admin?
  end

end
