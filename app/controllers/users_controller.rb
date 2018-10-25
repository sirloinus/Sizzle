class UsersController < ApplicationController

  # before_action :require_logged_in, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
      #redirect_to new_user_path
    end
  end

  def show
    # authorized_for(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[current_user.id])
  end

  def update
    @dog.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params

    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
