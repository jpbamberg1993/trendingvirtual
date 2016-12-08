class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  before_save :default_vote_count

  def default_vote_count
    self.upvote ||= 0
    self.downvote ||= 0
  end
end
