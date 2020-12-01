class UserController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = 'User name must have at least 4 characters. Or name has already been taken. Try again.'
      redirect_to new_user_path
      # render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
