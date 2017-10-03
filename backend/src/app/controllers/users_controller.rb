class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create!(user_params)
    redirect_to '/'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to signup_path
  rescue
    render 'public/500'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
