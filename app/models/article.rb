class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :main_photo, dependent: :destroy

  validates :title, :content, presence: true

  max_paginates_per 100

  def liked_count
    self.likes.size
  end

  def comments_count
    self.comments.size
  end

  def data_time
    self.created_at.strftime("%Y-%m-%d %H:%M")
  end

  def data_time_cn
    self.created_at.strftime("%m月%d号")
  end

  def to_html
    self.content = Markdown.new(content).to_html
    self
  end
end
