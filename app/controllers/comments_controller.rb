class CommentsController < ApplicationController
  layout 'show_articles'

  def create
    @comment = Comment.new(comment_params.merge(article_id: params[:article_id]))
    @article = Article.find(params[:article_id])
    @comments = @article.comments.order(created_at: :desc)
    cookies[:username] = @comment[:username]
    cookies[:email] = @comment[:email]

    if !@comment.save
      flash.now[:error] = '添加评论失败'
      render 'articles/show'
    else
      flash[:notice] = '添加评论成功'
      redirect_to @article
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :username, :email)
  end
end
