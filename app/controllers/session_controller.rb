class SessionController < ApplicationController
  def new
    # @session = session[]
  end

  def create
    user = User.find_by(name: params[:name])
    if user.is_a?(User)
      session[:user_id] = user.id
      flash[:success] = 'Logged in succesfully.'
      redirect_to root_path
    else
      flash[:danger] = 'User was not found. Try again.'
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Logged Out succesfully'
    redirect_to root_path
  end
end
