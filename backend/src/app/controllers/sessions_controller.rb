class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username!(params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to login_path
    end
  rescue ActiveRecord::RecordNotFound => e
    redirect_to login_path
  rescue
    render 'public/500'
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
