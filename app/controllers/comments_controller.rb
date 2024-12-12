# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post
  def create
    if user_signed_in?
      @comment = @post.comments.new(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to post_path(@post), notice: I18n.t('comment.save')
      else
        redirect_to post_path(@post), alert: I18n.t('comment.failed')
      end
    else
      redirect_to new_user_session_path, alert: I18n.t('comment.fail')
    end
  end

  def reply
    if user_signed_in?
      @parent_comment = PostComment.find(params[:id])
      @comment = @post.comments.new(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to post_path(@post), notice: I18n.t('comment.save')
      else
        redirect_to post_path(@post), alert: I18n.t('comment.failed')
      end
    else
      redirect_to new_user_session_path, alert: I18n.t('comment.fail')
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
