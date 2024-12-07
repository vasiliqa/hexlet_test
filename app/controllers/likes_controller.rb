class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

  def like
    @like = current_user.post_likes.create(post: @post)
    redirect_to @post
  end

  def unlike
    @like = current_user.post_likes.find_by(post: @post)
    @like.destroy if @like
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
