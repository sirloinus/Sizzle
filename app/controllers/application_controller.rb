class ApplicationController < ActionController::Base

  # protect_from_forgery with: :null_session
  helper_method :current_user, :logged_in?

    # def current_user
    #   @user = (User.find_by(id: session[:user_id]) || User.new)
    # end

    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      else
        User.new
      end
    end

    # def logged_in?
    #   current_user.id != nil
    # end

    def logged_in?
      !!current_user.id
    end
    #
    # def require_logged_in
    #   return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    # end

    def authorized?
      if !logged_in?
        flash[:authorized] = "You are not logged in"
        redirect_to login_path and return
      end
    end

    def authorized_for(user_id)
      if current_user.admin == true
        true
      elsif current_user.id != user_id.to_i
        flash[:authorized] = "You cannot view a page that's not authorized"
        redirect_to current_user
      end
    end
    #change it depends on our app. who is authorized? 

end
