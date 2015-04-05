class Admin::PostsController < ApplicationController
  layout 'admin'

  before_action do
    unless login?
      flash[:error] = '请先登录后再操作'
      redirect_to signin_path
    end
  end

  def preview
    html = Markdown.new(params[:body]).to_html
    render text: html
  end

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def edit
    @article = Article.find(params[:id])
    @main_photo = @article.main_photo
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    photo = MainPhoto.find(params[:main_photo_id])
    if check_main_photo_multiple(@article.main_photo, photo)
      @article.main_photo.destroy
      photo.update(article_id: @article.id)
    end
    redirect_to @article.to_html
  end

  def new
    @article = Article.new
    @main_photo = MainPhoto.new
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    @main_photo = MainPhoto.where(id: params[:main_photo_id]).first
    if check_main_photo_validate(@main_photo)
      flash.now[:error] = '封面无效, 请重新上传'
      render :new
      return
    end

    if @article.save
      @main_photo.update(article_id: @article.id)
      redirect_to @article
    else
      flash.now[:error] = '新增文章失败: 内容或标题错误'
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_posts_path
  end

  private
  def check_main_photo_multiple(before_photo, after_photo)
    before_photo.id != after_photo.id
  end

  def check_main_photo_validate(photo)
    photo.blank? || photo.article.present?
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
