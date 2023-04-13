class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:author).find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
    authorize! :read, @post
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'Your post has been created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.alert = 'Sorry, something went wrong!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    authorize! :destroy, @post

    if @post.destroy
      flash[:success] = 'Post deleted successfully.'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Failed to delete post.'
      redirect_to @post
    end
  end

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
