module ApplicationHelper
  def logout_user
    session[:user_id] = nil
  end

  def login_user
    session[:user_id] = @user.id
  end

  def recipe_contents
    self.measures.each do |contents|
      @units = contents.units
    end
  end

end
