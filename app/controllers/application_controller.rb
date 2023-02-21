# ApplicationController is the base application controller
class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_user

  private

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

    def require_login
      unless current_user
        redirect_to login_path, alert: "Please login to continue"
      end
    end
end
