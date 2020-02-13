class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully signed up!'
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = 'Sign up failed!'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.all.order(created_at: :desc)
  end

  private

    def user_params
      params.require(:user).permit(:username, :full_name, :photo)
    end
end
