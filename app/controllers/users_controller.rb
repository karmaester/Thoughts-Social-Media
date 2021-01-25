class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.includes([avatar_image_attachment: :blob])
  end

  def show
    @user = User.find(params[:id])
    @users = User.all.includes([avatar_image_attachment: :blob])
    @thoughts = @user.thoughts.includes([:user])
    @thought = Thought.new
  end
end
