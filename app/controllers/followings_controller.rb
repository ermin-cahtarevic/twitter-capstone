class FollowingsController < ApplicationController

  def create
    user = User.find(params[:id])
    following = current_user.followings.new(followed_id: user.id)
    unless following.save
      flash[:danger] = 'Failed!'
    end  
    redirect_to request.referrer
  end

  def destroy
    following = Following.find_by(followed_id: params[:id], follower_id: current_user.id)
    if following.follower == current_user
      following.destroy
    else
      flash[:danger] = 'Fail'
    end
    redirect_to request.referrer
  end
end
