class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    respond_to do |format|
      format.html # show.html.erb
      format.json do
        render json: @user.as_json(
          include: { posts: { include: { comments: { only: %i[id text] } },
                              only: %i[id title text] } }, only: %i[id name photo bio]
        )
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end
end