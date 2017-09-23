class PostsController < ApplicationController


  before_action :search_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Your create new post'
    else
      render :new, warning: 'Opps we have got some problems'
    end
  end

  def edit

  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'ALL OK, your update post '
    else
      render :edit, warning: 'Opps we have got some problems'
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path
  end




  private

  def post_params
      params.require(:post).permit(:title, :body, :image)
  end

  def search_post
    @post = Post.find(params[:id])
  end

end
