# SessionsController handles login and logout requests
class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[ new create ]

  def create
    reset_session

    user = User.find_by email: session_params[:email]
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id

      redirect_to root_path, notice: "Login Successful"
    else
      flash.now[:alert] = "Login Unsuccessful"
      render :new
    end
  end

  def destroy
    reset_session

    redirect_to login_path, notice: "Logout Complete"
  end

  def new
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
