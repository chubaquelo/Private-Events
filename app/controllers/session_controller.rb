class SessionController < ApplicationController

  def new
    @session = session[]
  end

  def create
    # User.find_by(name: )
    @session = session[]
  end

  def destroy
  end
end