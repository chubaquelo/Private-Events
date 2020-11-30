class SessionController < ApplicationController
  def new
    # @session = session[]
  end

  def create
    user = User.find_by(name: params[:name])
    if user.is_a?(User)
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = 'User was not found.'
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
