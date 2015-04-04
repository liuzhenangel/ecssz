class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action do
    unless login?
      flash[:error] = '请先登录后再操作'
      redirect_to signin_path
      return
    end
  end

  def index
    @articles = Article.all.size
    @comments = Comment.all.size
  end
end
