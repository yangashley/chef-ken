module SessionsHelper
  def logged_in
    session[:user_id] != nil
  end

  def current_user
   @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin?
    if current_user != nil
      current_user.is_ken
    else
      false
    end
  end
end
