class UsersController < ApplicationController

  before_action :require_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
