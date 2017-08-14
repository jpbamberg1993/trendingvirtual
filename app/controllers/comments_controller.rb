class CommentsController < ApplicationController
  before_action :find_commentable
  respond_to :html, :json

  def new
    @comment = Comment.new
  end

  def create
    session[:return_to] ||= request.referer
    Comment.save_comment(@commentable, comment_params)
    redirect_to session.delete(:return_to)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(body: params[:comment][:body])
    respond_with @comment
  end

  def destroy
    session[:return_to] ||= request.referer
    Comment.find(params[:id]).destroy
    redirect_to session.delete(:return_to)
  end

  def upvote
    session[:return_to] ||= request.referer
    @comment = Comment.find(params[:id])
    @comment.vote_by voter: current_user
    redirect_to session.delete(:return_to)
  end

  def unupvote
    session[:return_to] ||= request.referer
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
    redirect_to session.delete(:return_to)
  end

  def downvote
    session[:return_to] ||= request.referer
    @comment = Comment.find(params[:id])
    @comment.downvote_from current_user
    redirect_to session.delete(:return_to)
  end

  def undownvote
    session[:return_to] ||= request.referer
    @comment = Comment.find(params[:id])
    @comment.undisliked_by current_user
    redirect_to session.delete(:return_to)
  end

  private

  def comment_params
    params.require(:comment).permit(:email, :username, :body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end
end
