class FriendshipsController < ApplicationController
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
  end

  def destroy
  end
end
