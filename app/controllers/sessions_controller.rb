class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = ["Invalid email or password"]
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to controller: 'welcome', action: 'home'
    #redirect_to login_path
  end

end
#
# user = user.try(:authenticate, params[:user][:password])
# return redirect_to(controller: 'sessions', action: 'new') unless user
# session[:user_id] = user.id
# @user = user
# redirect_to user_path(@user)
