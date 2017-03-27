class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "That looks like a delicious dish!"
      redirect_to @post
    else
      flash[:alert] = 'Forgetting something? You need an image to post here!'
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
