class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    render :new
  end

  def create
    params[:event][:admin_id] = current_user.id
    @event = Event.new(params[:event])

    if @event.save
      EventUser.create(event_id: @event.id, user_id: current_user.id, status: "GOING")
      Wall.create(wallable_type: "Event", wallable_id: @event.id)
      redirect_to event_url(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    render :edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to event_url(@event)
    else
      redirect_to event_url(@event)
    end
  end

  def show
    @event = Event.find(params[:id])
    render :show
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_url(current_user)
  end

end
