class AttendeeController < ApplicationController

def create
  @attendee = Attendee.new(attendee_params)
  if @attendee.save
    redirect_to event_path(attendee_params[:event_id])
  end
end

def destroy
  @attendee = Attendee.find_by(user_id: attendee_params[:user_id])
  if @attendee.destroy
    redirect_to event_path(attendee_params[:event_id])
  end
end

private

def attendee_params
  params.require(:attendee).permit(:user_id, :event_id)
end

end