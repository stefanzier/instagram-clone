class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all 
  end

  def new
   @post = Post.new 
  end

  def create
    if @post = Post.create(post_params)
     flash[:success] = "Your post has been created on the line!"
     redirect_to posts_path
    else
      flash[:alert] = "Uh oh! Your post couldn't be saved... Check the form!"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:success] = "Your post was updated!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong. Check the form!"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post was removed!"
    redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:caption, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
