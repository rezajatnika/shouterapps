class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      login user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email or password!'
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path, success: 'Logged out!'
  end

  private

  def logged_in_user
    redirect_to current_user, info: 'You are already logged in!' if logged_in?
  end
end
