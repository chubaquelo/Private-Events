class EventController < ApplicationController

  def index
    @events_past = Event.past
    @events_future = Event.future
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.authored_events.build(params.require(:event).permit(:location, :datetime))
    @event.save
    redirect_to event_path(current_user.id)
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
    # @event = Event.find(current_user.id)
  end

end