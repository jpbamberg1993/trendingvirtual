class Article < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :category
  validates :title, presence: true, length: { minimum: 5 }
end
