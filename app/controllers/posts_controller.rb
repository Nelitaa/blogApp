class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @like = Like.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Post not created!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = 'Post Deleted Successfully!'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :show, status: 400
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
