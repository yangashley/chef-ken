class UsersController < ApplicationController
  include ApplicationHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_deets)
    if @user.save
      flash[:notice] = 'Account creation successful!'
      login_user
      redirect_to profile_path(@user)
    else
      flash[:alert] = 'Account creation failed'
      @errors = @user.errors.full_messages
      render action: 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  private
  def user_deets
      params.require(:user).permit(:name, :email, :password)
  end
end
