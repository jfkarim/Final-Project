class NewsFeedsController < ApplicationController

  def show
    @user = User.includes({wall: :posts}, :photos, :albums, {friends: [{wall: :posts}, :photos, :albums]}).find(params[:user_id])
    @news = []

    @news += @user.wall.posts
    @news += @user.albums
    @news += @user.photos.where(album_id: nil)

    # self.groups.each do |group|
    #  news += group.wall.posts
    # end
    #
    # self.events.each do |event|
    #  news += event.wall.posts
    # end

    @user.friends.each do |friend|
     @news += friend.wall.posts
     @news += friend.albums
     @news += friend.photos.where(album_id: nil)
    end

    @news = @news.sort_by { |n| n.created_at }
    render :show
  end

end
