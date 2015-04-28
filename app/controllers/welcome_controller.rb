class WelcomeController < ApplicationController
  def index
    params[:page] = 1 if params[:page].blank?
    @articles = Article.order(created_at: :desc).page(params[:page]).per(5)
    flash.now[:notice] = '还没有内容' if @articles.blank?
    render :layout => 'have_background_image'
  end
end
