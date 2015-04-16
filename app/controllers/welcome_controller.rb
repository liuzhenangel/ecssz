class WelcomeController < ApplicationController
  def index
    params[:page] = 1 if params[:page].blank?
    @articles = Article.order(created_at: :desc).page(params[:page]).per(2)
    render :layout => 'have_background_image'
  end
end
