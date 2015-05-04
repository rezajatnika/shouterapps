module SessionsHelper
  # Login helper
  def login(user)
    session[:user_id] = user.id
  end

  # Returns the current logged in user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  # Returns true if the user logged in
  def logged_in?
    !current_user.nil?
  end

  # Logout user
  def logout
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Remeber user in persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Forget user from session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Returns true if user is the current user
  def current_user?(user)
    user == current_user
  end

  # Friendly redirect
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Store url
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
