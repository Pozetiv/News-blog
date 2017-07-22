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

  def update
  end

  def destroy
  end
end
