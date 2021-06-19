class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path(@post)
    else
      redirect_to posts_path(@post)
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
    @tag_list = Tag.all
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @comment = Comment.new
    @review = Review.new
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
    redirect_to posts_path
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  def post_params
    params.require(:post).permit(:image, :place, :description, :adress)
  end

end
