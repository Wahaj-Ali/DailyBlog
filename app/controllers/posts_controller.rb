class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
  end

  def new 
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(author: @user, title: params[:post][:title], text: params[:post][:text])

    if @post.save
      flash[:notice] = 'Your post has been created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.alert = 'Sorry, something went wrong!'
      render :new
    end
  end
end
