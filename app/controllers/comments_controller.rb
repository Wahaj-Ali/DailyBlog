class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(author: @user, post: @post, text: params[:comment][:text])
    @comment.save
    redirect_to user_post_path(@post.author, @post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.destroy
      flash[:success] = 'Comment deleted successfully.'
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      flash[:error] = 'Failed to delete comment.'
      redirect_to @comment.post
    end
  end
end
