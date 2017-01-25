module ApplicationHelper
  def logout_user
    session[:user_id] = nil
  end

  def login_user
    session[:user_id] = @user.id
  end
end
