class EventController < ApplicationController

  def index
    @events = Event.all
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
    @event = Event.all.where(author_id: current_user.id)
    # @event = Event.find(current_user.id)

  end

end