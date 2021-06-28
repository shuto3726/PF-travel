class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path(@post), notice: "新しく投稿されました！"
    else
      render "new"
    end
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
    @prefectures = Prefecture.order(:id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿が編集されました！"
    else
      render "edit"
    end
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

  private

  def post_params
    params.require(:post).permit(:image, :place, :description, :date, :latitude, :longitude, :prefecture_id)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
