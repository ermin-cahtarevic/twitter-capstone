module OpinionsHelper
  def following_opinions
    #users = User.includes(:opinions, :followings).where(followings: current_user.id)
    #Opinion.where('user_id IN (?)', users).order(created_at: :desc)
    ids = current_user.followings.pluck(:followed_id) << current_user.id
    @opinions = Opinion.following_opinions(current_user)
  end
end
