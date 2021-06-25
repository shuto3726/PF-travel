class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @prefectures = Prefecture.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root
  end

  def favorites
    @user = User.find(params[:id])
    @posts = @user.favorite_posts.page(params[:page]).reverse_order
    @prefectures = Prefecture.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
