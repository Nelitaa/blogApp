class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      flash[:alert] = 'Comment not created!'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:notice] = 'Comment Deleted Successfully!'
      redirect_to user_post_path(user_id: current_user.id, id: @comment.post_id)
    else
      flash[:alert] = @comment.errors.full_messages.first if @comment.errors.any?
      render :show, status: 400
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
