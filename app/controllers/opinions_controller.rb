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
      render :new
    end
  end

  def index
    @opinion = current_user.opinions.build if current_user
    @opinions = Opinion.all
  end
  

  private

    def opinion_params
      params.require(:opinion).permit(:text)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end
end