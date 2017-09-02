class Article < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :category
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }

  def self.search(search)
    where(
      'title LIKE ? OR text LIKE ? OR author LIKE ? OR subject LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
    )
  end
end
