class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to posts_path(@post)
  end

  def index_by_prefecture
    @user = current_user
    @prefectures = Prefecture.all
    if params[:prefecture_id].present?
      prefecture_id = params[:prefecture_id]
      @posts = Post.where(prefecture_id: prefecture_id).page(params[:page]).reverse_order
    else
      @posts = Post.all
    end
  end

  def index
    @user = current_user
    @posts = Post.page(params[:page]).reverse_order
    @post = current_user.posts.new
    @prefectures = Prefecture.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
    @prefectures = Prefecture.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  def map
    respond_to do |format|
      format.js
    end
  end

  def post_params
    params.require(:post).permit(:image, :place, :description, :date, :latitude, :longitude, :prefecture_id )
  end

end
