class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :main_photo, dependent: :destroy

  validates :title, :content, presence: true

  paginates_per 2
  max_paginates_per 10

  def liked_count
    self.likes.size
  end

  def data_time
    self.created_at.strftime("%Y-%m-%d %H:%M")
  end

  def to_html
    self.content = Markdown.new(content).to_html
    self
  end
end
