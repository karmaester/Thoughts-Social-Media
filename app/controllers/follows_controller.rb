class FollowsController < ApplicationController
    before_action :authenticate_user!

    # POST /followings/user
    # POST /followings/user.json
    def create
        @follow = Follow.create(follow_params)
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
        @follow = Follow.where(follower_id: current_user.id, followed_id: user.id).first
        @follow.destroy
        redirect_to users_path, notice: 'You successfully unfollowed'
    end

    private

    def follow_params
        params.require(:follow).permit(:follower_id, :followed_id)
    end

end
