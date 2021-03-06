class ArticlesController < ApplicationController
  def index
    params[:page] = 1 if params[:page].blank?
    @articles = Article.order(created_at: :desc).page(params[:page]).per(10)
    flash.now[:notice] = '暂时没有数据' if @articles.blank?
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    render :layout => 'show_articles'
  end

  def search
    @articles = Article.where("title like ? OR content like ?", "%#{params[:q]}%", "%#{params[:q]}%").order(created_at: :desc).page(params[:page]).per(10)
    if @articles.blank?
      flash.now[:error] = '没有你要找的内容'
      return
    end

    @articles.map do |a|
      a.title = a.title.gsub(params[:q].to_s, "<em>#{params[:q]}</em>")
    end
  end
end
