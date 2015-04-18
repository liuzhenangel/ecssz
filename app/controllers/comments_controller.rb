class CommentsController < ApplicationController
  layout 'show_articles'

  def create
    @comment = Comment.new(comment_params.merge(article_id: params[:article_id]))
    cookies[:username] = @comment[:username]
    cookies[:email] = @comment[:email]

    if @comment.save
      @success = true
      flash.now[:notice] = '添加评论成功'
    else
      @success = false
      flash.now[:error] = '添加评论失败'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :username, :email)
  end
end
