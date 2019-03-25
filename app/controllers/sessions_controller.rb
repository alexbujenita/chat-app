class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(nickname: params[:session][:nickname])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def destroy
  end
end
