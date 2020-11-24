class EventController < ApplicationController
  def index
    @events_past = Event.past.order('datetime DESC')
    @events_future = Event.future.order('datetime ASC')
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.authored_events.build(event_params)
    @event.save
    redirect_to event_path(@event.id)
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
    @attendee = Attendee.new
  end

  private

  def event_params
    params.require(:event).permit(:location, :datetime)
  end
end
