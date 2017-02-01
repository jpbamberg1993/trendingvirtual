module CommentsHelper
  def user_upvoted?(comment)
    current_user.voted_up_on?(comment) if current_user.present?
  end

  def user_downvoted?(comment)
    current_user.voted_down_on?(comment) if current_user.present?
  end

  def upvotes_present?(comment)
    comment.get_upvotes.size.to_i.zero? ? '' : comment.get_upvotes.length
  end

  def downvotes_present?(comment)
    comment.get_downvotes.size.to_i.zero? ? '' : comment.get_downvotes.length
  end
end
