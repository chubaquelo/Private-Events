class ApplicationController < ActionController::Base
  
  helper_method :current_user, :auth_own_method?
  
  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  # def auth_own_method?(user_id)
  #   return true if User.find(user_id).is_a()
  # end
end
