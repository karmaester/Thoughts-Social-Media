module UsersHelper
    def follow_unfollow(user)
        cntnt = link_to 'Unfollow', follow_path(user), method: :delete, class: 'btn'
        return cntnt if current_user.followds.include?(user)
    
        cntnt = link_to 'Follow', follows_path(follow: { follower_id: current_user.id, followed_id: user.id}), method: :post, class: 'btn'
        return cntnt unless current_user.followds.include?(user) || current_user == user
    
        nil
      end
end