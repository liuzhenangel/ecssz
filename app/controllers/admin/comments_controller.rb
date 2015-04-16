class Admin::CommentsController < ApplicationController
  layout 'admin'

  before_action do
    unless login?
      flash[:error] = '请先登录后再操作'
      redirect_to signin_path
    end
  end

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments.order(created_at: :desc)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = '删除评论成功'
      redirect_to admin_comments_path(article_id: @article)
    else
      flash[:error] = '删除评论失败'
      redirect_to admin_comments_path(article_id: @article)
    end
  end
end
