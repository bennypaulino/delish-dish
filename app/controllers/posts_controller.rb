class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
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

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
    flash[:success] = 'Dish updated!'
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
