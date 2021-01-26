module ApplicationHelper
  include UsersHelper

  def like_or_dislike_btn(thought)
    like = Like.find_by(thought: thought, user_id: current_user)
    if like
      link_to '<i class="bi bi-hand-thumbs-down-fill">dislike</i>'.html_safe, like_path(id: like.id, thought_id: thought.id), method: :delete, class: 'like-button'
    else
      link_to '<i class="bi bi-hand-thumbs-up-fill">like</i>'.html_safe, likes_path(thought_id: thought.id), method: :post, class: 'like-button' 
    end
  end
end
