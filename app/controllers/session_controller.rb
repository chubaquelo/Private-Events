class SessionController < ApplicationController

  def new
    # @session = session[]
  end

  def create
    user = User.find_by(name: params[:name])
    session[:user_id] = user.id
    redirect_to root_path

  end

  def destroy
  end
end