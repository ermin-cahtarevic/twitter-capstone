module FollowingsHelper
  def not_following
    users = current_user.followings.map(&:followed)
    users << current_user
    User.where('id NOT IN (?)', users).order(created_at: :desc).limit(10)
  end

  def following?(user)
    current_user.followings.map(&:followed).include?(user)
  end

  def followed_by(user)
    user.followers.map(&:follower).last(5)
  end
end
