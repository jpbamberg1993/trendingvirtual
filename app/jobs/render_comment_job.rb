class RenderCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "#{comment.commentable_type.downcase}:#{comment.commentable_id}:comments",
                                 comment: render_comment(comment)
  end

  private
    def render_comment(comment)
      user = User.find(comment.user_id)
      ApplicationController.render_with_signed_in_user(
        user,
        partial: 'comments/comment',
        locals: { comment: comment })
    end
end
