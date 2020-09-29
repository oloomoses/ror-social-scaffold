class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends

    @pending = current_user.pending_friends

    @sent_requests = current_user.friend_requests
  end

  def create
    @request = current_user.friendships.build(:friend_id => params[:friend_id])

    if @request.save
      flash[:notice] = 'Request sent'
      redirect_to users_path
    else
      flash[:notice] = 'There has been a problem sending request'
      redirect_to users_path
    end
  end

  def update
    friend = User.find(params[:id])
    @friendship = current_user.confirm_friend(friend)

    if @friendship
      # Friendship.update(confirmed: true)
      flash[:notice] = 'Friendship confirmed'
      redirect_back fallback_location: :back
    else
      flash[:notice] = 'Ooops!, Something went wrong.'
      redirect_back fallback_location: :back
    end
  end

  def destroy
    friend = User.find(params[:id])

    unfriend = current_user.friendships.find_by(friend_id: friend.id)

    if unfriend
      unfriend.destroy
      flash[:notice] = 'Success!'
      redirect_to friendships_path
    else
      flash[:notice] = 'Error! Cannot Unfriend'
      redirect_to friendships_path
    end
  end
end
