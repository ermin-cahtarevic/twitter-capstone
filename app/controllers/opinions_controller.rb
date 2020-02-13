class OpinionsController < ApplicationController
  before_action :require_login

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.create(opinion_params)
    if @opinion.save
      redirect_to opinions_path
    else
      redirect_to request.referrer
    end
  end

  def index
    @opinion = current_user.opinions.build if current_user
  end

  def discover
    users = current_user.followings.map(&:followed)
    return @not_followed = User.all.limit(10) if users.empty?

    @not_followed = User.where('id NOT IN (?)', users).order(created_at: :desc).limit(10)
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end

  def require_login
    return if logged_in?

    flash[:danger] = 'You must be logged in to access this section'
    redirect_to root_path
  end
end
