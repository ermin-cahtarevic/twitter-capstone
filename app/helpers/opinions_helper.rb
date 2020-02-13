module OpinionsHelper
  def following_opinions
    users = current_user.followings.map(&:followed)
    users << current_user
    Opinion.where('user_id IN (?)', users).order(created_at: :desc)
  end
end
