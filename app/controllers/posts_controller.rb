class PostsController < ApplicationController
  before_action :search_post, only: [:show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def show

  end

  def edit

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

    if @posts.update_attributes(post_params)
      redirect_to @posts
    else
      redirect_to :edite
    end
  end
def destroy

  @posts.destroy
  redirect_to posts_path
end


  private

  def search_post
    @posts = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)

  end
end
