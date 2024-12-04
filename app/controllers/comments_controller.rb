class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Комментарий добавлен.'
    else
      redirect_to @post, alert: 'Ошибка при добавлении комментария.'
    end
  end

  def reply
    @post = Post.find(params[:post_id])
    @parent_comment = PostComment.find(params[:id])
    @comment = @post.comments.new(comment_params)
    @comment.parent_id = @parent_comment.id
    @comment.user = current_user 

    if @comment.save
      redirect_to @post, notice: 'Ответ на комментарий добавлен.'
    else
      redirect_to @post, alert: 'Ошибка при добавлении ответа.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
