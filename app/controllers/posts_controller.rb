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
      flash.now[:alert] = 'Forgetting something? You need an image to post here!'
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
    @post.update_attributes(post_params)
    if @post.valid?
      flash[:success] = 'Dish updated!'
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Something is wrong with your form, check it again..."
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to root_path
    flash[:success] = 'Problem solved! Dish deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
