class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  acts_as_votable
  before_save :default_vote_count
  after_create_commit { RenderCommentJob.perform_later(self) }

  def default_vote_count
    self.upvote ||= 0
    self.downvote ||= 0
  end

  def self.save_comment(commentable, comment_params)
    if (commentable.class != Article) &&
      (commentable.commentable.class == Comment)
      commentable = commentable.commentable
    end
    comment = commentable.comments.new comment_params

    if comment.save
      'Your comment was successfully posted!'
    else
      'Your comment wasn\'t posted!'
    end
  end
end
