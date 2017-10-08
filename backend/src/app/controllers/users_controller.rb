class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create! user_params
    session[:user_id] = user.id
    redirect_to '/'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to signup_path
  rescue
    render file: 'public/500'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
