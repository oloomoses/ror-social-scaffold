class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends

    @pending = current_user.pending_requests

    @sent_requests = current_user.friend_requests
  end

  def create
    @request = current_user.friendships.build(friend_id: params[:friend_id])

    flash[:notice] = if @request.save
                       'Request sent'
                     else
                       'There has been a problem sending request'
                     end
    redirect_to users_path
  end

  def update
    friend = User.find(params[:id])
    @friendship = current_user.confirm_friend(friend)

    if @friendship
      Friendship.create!(friend_id: friend.id, user_id: current_user.id, confirmed: true)
      flash[:notice] = 'Friendship confirmed'
    else
      flash[:notice] = 'Ooops!, Something went wrong.'
    end
    redirect_back fallback_location: :back
  end

  def destroy
    friend = User.find(params[:id])

    friendship = friend.friendships.find_by(friend_id: current_user.id)
    other_friendship = current_user.friendships.find_by(friend_id: friend.id)

    if friendship || other_friendship
      friendship&.destroy
      other_friendship&.destroy
      friend.friend_requests.delete(current_user)
      flash[:notice] = 'Success!'
    else
      flash[:notice] = 'Error! Cannot Unfriend'
    end
    redirect_to friendships_path
  end
end
