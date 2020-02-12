class FollowingsController < ApplicationController

  def create
    user = User.find(params[:id])
    following = current_user.followings.new(followed_id: user.id)
    if following.save
      flash[:success] = 'Followed'
    else
      flash[:danger] = 'Failed!'
    end  
    redirect_to request.referrer
  end

  def destroy
    following = Following.find(params[:id])
    if following.follower == current_user
      following.destroy
      flash[:success] = 'Unfollowed'
    else
      flash[:danger] = 'Fail'
    end
    redirect_to request.referrer
  end
end
