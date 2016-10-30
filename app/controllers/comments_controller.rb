class CommentsController < ApplicationController
  before_action :find_commentable
  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: 'Your comment wasn\'t posted!'
    end
  end

  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(params[:commentable_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:email, :username, :body)
  end
end
