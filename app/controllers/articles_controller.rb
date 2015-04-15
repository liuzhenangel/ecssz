class ArticlesController < ApplicationController
  def index
    params[:page] = 1 if params[:page].blank?
    @articles = Article.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id]).to_html
    @comment = Comment.new
    @comments = @article.comments.order(created_at: :desc)
  end

  def search
    @articles = Article.where("title like ? OR content like ?", "%#{params[:q]}%", "%#{params[:q]}%").order(created_at: :desc).page(params[:page]).per(10)
    if @articles.blank?
      flash.now[:error] = '没有你要找的内容'
      return
    end

    @articles.map do |a|
      a.title = a.title.gsub(params[:q].to_s, "<em>#{params[:q]}</em>")
      unless a.content.include?('/uploads/photo/image')
        a.content = a.content.gsub(params[:q].to_s, "<em>#{params[:q]}</em>")
      end
      htmlstring = TruncateHtml::HtmlString.new(a.to_html.content)
      a.content = TruncateHtml::HtmlTruncator.new(htmlstring).truncate
    end
  end
end
