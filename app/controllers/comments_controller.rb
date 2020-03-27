class CommentsController < ApplicationController
  before_action :author_login, only: [:create]

  def author_login
    unless current_user
      redirect_to article_path (params[:article_id])
      return false
    end
  end
  
  def create
    @comment = Comment.new (comments_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article)
  end

  def comments_params
    params.require(:comment).permit(:author_name, :body)
  end
end
