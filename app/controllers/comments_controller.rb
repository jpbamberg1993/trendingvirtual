class CommentsController < ApplicationController
  before_action :find_commentable
  respond_to :html, :json

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

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(body: params[:comment][:body])
    respond_with @comment
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(params[:commentable_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:email,
                                    :username,
                                    :body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end
end
