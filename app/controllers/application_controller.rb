class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?, :check_assistance

  def current_user
    @current_user ||= session[:user_id] &&
                      User.find_by(id: session[:user_id])
  end

  # rubocop:disable Style/DoubleNegation
  def signed_in?
    !!current_user
  end
  # rubocop:enable Style/DoubleNegation

  def check_assistance(user, event)
    return true if Attendee.where(user_id: user, event_id: event).any?
    false
  end
end
