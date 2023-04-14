class CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    post = user.post.(params[:post_id])
    comments = post.comments
    render json: comments
  end

  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(author: @user, post: @post, text: params[:comment][:text])
    # redirect_to user_post_path(@post.author, @post)
    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_path(@post.author, @post)
        end
        format.json do
          render json: {status: 'success', message: 'Comment created successfully', data: @comment }, status: created
        end
      else
        format.html do
          {render: new}
        end
        format.json do
          render json: {status: 'error', message: 'Failed to create comment'}, status: unprocessable_entity
        end
      end
  end
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
