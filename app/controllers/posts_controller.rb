class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "That looks like a delicious dish!"
      redirect_to @post
    else
      flash.now[:alert] = "Your DelishDish couldn't be created, please check the form."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.valid?
      flash[:success] = 'Dish updated!'
      redirect_to(post_path(@post))
    else
      flash.now[:alert] = "Something is wrong with your form, please check it again..."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
    flash[:success] = 'Problem solved! Dish deleted.'
  end

  private

  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
