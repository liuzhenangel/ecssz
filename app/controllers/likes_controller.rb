class LikesController < ApplicationController
  layout false

  def create
    article = Article.find(params[:article_id])
    like = Like.new(:article_id => article.id)
    if like.save
      render :json => { success: true, id: like.id, count: article.reload.liked_count }
    else
      render :json => { success: false, count: article.reload.liked_count }
    end
  end

  def destroy
    like = Like.find(params[:id])
    article = like.article
    if like.destroy
      render :json => { success: true, count: article.reload.liked_count }
    else
      render :json => { success: false, count: article.reload.liked_count }
    end
  end
end
