class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def show
    @posts = Post.find(params[:id])

  end

  def edite
    @posts = Post.find(params[:id])
  end

  def delete
  end

  def create
    @posts = Post.new(post_params)
    if @posts.save
      redirect_to :show
    else
      render :new
    end
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update_attributes(post_params)
      redirect_to @posts
    else
      redirect_to :edite
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)

  end
end
