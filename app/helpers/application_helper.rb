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

  def get_category_by_name
    @category ||= Category.find_by(name: params[:id])
  end

end
