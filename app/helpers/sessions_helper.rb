module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
    @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.autenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
      end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    cookies.permament.signed[:user_id] = user.id
    cookies.permament[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(defaut)
    redirect_to(session[:forwarding_url] || defaut)
    session.delete[:forwardinf_url]
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
