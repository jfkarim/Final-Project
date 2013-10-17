class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(in_friend_id: params[:user_id], out_friend_id: current_user.id)

    if @friendship.save
      render json: @friendship
    else
      redirect_to user_url(current_user)
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.approve!
    new_friend = User.find(@friendship.out_friend_id)
    new_friendship = Friendship.create(in_friend_id: new_friend.id, out_friend_id: current_user.id)
    new_friendship.approve!
    redirect_to user_url(new_friend)
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    Friendship.where(in_friend_id: @friendship.out_friend_id, out_friend_id: @friendship.in_friend_id)[0].destroy
    @friendship.destroy
    render partial: "users/add_friend", locals: {user: User.find(params[:user_id])}
  end
end
