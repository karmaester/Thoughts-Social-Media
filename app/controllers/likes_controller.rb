class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = current_user.likes.new(thought_id: params[:thought_id])

    if @like.save
      redirect_to thoughts_path, notice: 'You liked a thought'
    else
      redirect_to thoughts_path, alert: 'You cannot like this thought'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user_id: current_user, thought_id: params[:thought_id])
    if like
      like.destroy
      redirect_to thoughts_path, notice: 'You disliked a thought.'
    else
      redirect_to thoughts_path, alert: 'You cannot dislike this.'
    end
  end
end
