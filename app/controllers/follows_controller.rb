class FollowsController < ApplicationController
    before_action :authenticate_user!

    # POST /followings/user
    # POST /followings/user.json
    def create
        @follow = Follow.create(follower_id: params[:follower_id], followed_id: params[:followed_id])
        if @follow.save
            flash[:notice] = "You started following"
        else
            flash[:alert] = "Error to follow"
        end
        redirect_to users_path
    end

    # DELETE /followings/1
    # DELETE /followings/1.json
    def destroy
        @follow = Follow.find_by(follower_id: params[:follower_id], followed_id: params[:followed_id])
        @follow.destroy
        redirect_to users_path, notice: 'You successfully unfollowed'
    end

    private

    def follow_params
        params.fetch(:follow, {})
      end

end
