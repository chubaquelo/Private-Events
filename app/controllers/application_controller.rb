class ApplicationController < ActionController::Base
  
  helper_method :current_user, :signed_in?
  
  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  def signed_in?
   !!current_user
  end
end
