class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      flash[:success] = 'Signed in.'
      log_in @user
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    log_out @user if logged_in?
    redirect_to root_path
  end
end
