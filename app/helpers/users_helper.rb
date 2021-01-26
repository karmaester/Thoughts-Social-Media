module UsersHelper
  def follow_unfollow(user)
    if current_user == user
      nil
    elsif current_user.followds.include?(user)
      cntnt = link_to 'Unfollow', follow_path(user), method: :delete, class: 'button is-info'
      return cntnt 
    else
      cntnt = link_to 'Follow', follows_path(follow: { follower_id: current_user.id, followed_id: user.id }),
                      method: :post, class: 'button is-info'
      return cntnt 
    end
  end

  def user_avatar(user)
    if user.avatar_image.attached?
      image_tag user.avatar_image
    else
      image_tag('https://images.emojiterra.com/twitter/512px/1f464.png', class: 'rounded-circle', height: 130,
                                                                         width: 130)
    end
  end

  def user_cover
    if @user.cover_image.attached?
      image_tag @user.cover_image, class: 'cover'
    else
      image_tag(
        'https://i.ibb.co/ThDZL98/Chromatic-Linked-In-Cover-Photo-Background.png', class: 'cover'
      )
    end
  end

  def display_unfollowed(user)
    if user != current_user && !current_user.followds.include?(user)
      true
    else
      false
    end
  end
end
