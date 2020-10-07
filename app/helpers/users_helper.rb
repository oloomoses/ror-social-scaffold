module UsersHelper
  def unfriended_users(user)
    friend = current_user.friends.include?(user)
    accept = current_user.friend_requests.include?(user)
    pending = current_user.pending_requests.include?(user)

    if accept
      content_tag(:br) do
        content_tag(:div) do
          link_to 'Accept Request', friendship_path(id: user), method: :put, class: 'btn'
        end
      end +
        content_tag(:br) do
          content_tag(:div) do
            link_to 'Decline Request', friendship_path(id: user), method: :delete, class: 'btn btn-danger'
          end
        end

    elsif pending
      link_to 'Pending Request', '', class: 'btn'
    elsif !friend
      link_to('Friend Request', friendships_path(friend_id: user), method: :post, class: 'btn btn-primary')
    else
      link_to 'Unfriend', friendship_path(id: user), method: :delete, class: 'btn btn-danger'
    end
  end
end
