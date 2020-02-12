module OpinionsHelper

  def not_following
    #User.where("user_id IN (?)", following_ids)
    users = current_user.following_ids
    User.where("id NOT IN (?)", users)
  end
end
