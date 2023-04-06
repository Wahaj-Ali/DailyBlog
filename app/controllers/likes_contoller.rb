class LikesController < ApplicationController
  def create
    @post = Post.find(parmas[:post_id])
    @user = current_user
    @like = Like.new(author: @user, post: @post)
    @like.save
    redirect_to user_post_path(@user, @psot)
  end
end