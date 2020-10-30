class FriendshipsController < ApplicationController
  def create
    current_user.friendships.create(friend_id: params[:user_id])
    redirect_to users_path
  end

  def destroy
    current_user.reject_request(params[:friend_id])
    redirect_to users_path
  end

  def update
    accept = current_user.reverse_friendship.find_by(user_id: params[:friend_id])
    accept.confirm = true
  if accept.save
    Friendship.create(user_id: current_user.id, friend_id:params[:friend_id], confirm: true)
    redirect_to users_path
  end
  end

  private

  def friendship_params
    params.permit(:friend_id)
  end
end
