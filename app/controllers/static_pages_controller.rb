class StaticPagesController < ApplicationController
  before_action :logout

  def home; end

  private

  def logout
    if logged_in?
      redirect_to opinions_path
    end
  end
end
