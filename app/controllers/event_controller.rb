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
    if @event.save
      flash[:success] = 'Event was created succesfully.'
      redirect_to event_path(@event.id)
    else
      flash[:danger] = 'Location must have more than 4 characters and date must be correct.'
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.users
    @attendee = Attendee.new
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.author == current_user && @event.destroy
      flash[:success] = 'Event deleted successfully'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'Event not destroyed'
      redirect_to event_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :datetime)
  end
end
