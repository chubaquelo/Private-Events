class AttendeeController < ApplicationController
  def create
    @attendee = Attendee.new(attendee_params)
    redirect_to event_path(attendee_params[:event_id]) if @attendee.save
  end

  def destroy
    @attendee = Attendee.find_by(user_id: attendee_params[:user_id])
    redirect_to event_path(attendee_params[:event_id]) if @attendee.destroy
  end

  private

  def attendee_params
    params.require(:attendee).permit(:user_id, :event_id)
  end
end
