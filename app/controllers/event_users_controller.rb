class EventUsersController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @users = User.all
    render :new
  end

  def create
    @event = Event.find(params[:event_id])
    @event_user = EventUser.new(
      user_id: params[:user_id],
      event_id: params[:event_id],
      status: "PENDING")

    if @event_user.save
      redirect_to new_event_event_user_url(@event)
    else
      redirect_to new_event_event_user_url(@event)
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @event_user = EventUser.find(params[:id])
    @event_user.update_attributes(status: params[:status])
    redirect_to user_url(current_user)
  end


  def destroy
    @event = Event.find(params[:event_id])
    @event_user = EventUser.find(params[:id])
    @event_user.destroy
    redirect_to edit_event_url(@event)
  end


end
