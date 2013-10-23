class NewsFeedsController < ApplicationController

  def show
    @user = User.includes({wall: :posts}, :photos, :albums, {friends: [{wall: :posts}, :photos, :albums]}).find(params[:user_id])
    @news = []

    @news += @user.wall.posts
    @news += @user.albums
    @news += @user.photos.where(album_id: nil)

    @user.friends.each do |friend|
     @news += friend.wall.posts
     @news += friend.albums
     @news += friend.photos.where(album_id: nil)
    end

    @news = @news.sort_by { |n| n.created_at }
    @news.reverse!
    render :show
  end

end
