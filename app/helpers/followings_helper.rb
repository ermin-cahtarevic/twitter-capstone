module FollowingsHelper

  def not_following
    users = current_user.followings.map { |f| f.followed }
    users << current_user
    User.where("id NOT IN (?)", users).order(created_at: :desc).limit(10)
  end

  def following?(user)
    current_user.followings.map { |f| f.followed }.include?(user)
  end

  def followed_by(user)
    users = user.followers.map { |x| x.follower }.last(5)
  end
end
