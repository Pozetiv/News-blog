class PostsController < ApplicationController
  before_action :search_post, only: [:show, :edit, :update, :destroy ]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
    @posts = Post.new
  end

  def show

  end

  def edit
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

    if @posts.update_attributes(post_params)
      redirect_to @posts
    else
      redirect_to :edit
      flash[:info] = "Opps we have some problems"
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
    params.require(:post).permit(:title, :body, :image)

  end
end
