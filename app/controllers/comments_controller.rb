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
end
