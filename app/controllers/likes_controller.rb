class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_like, only: [:destroy]

  def create
    @like = @post.post_likes.new(user: current_user)

    if @like.save
      redirect_to @post, notice: 'Вы поставили лайк этому посту!'
    else
      redirect_to @post, alert: 'Не удалось поставить лайк.'
    end
  end

  def destroy
    if @like.user == current_user
      if @like.destroy
        redirect_to @post, notice: 'Вы убрали лайк с этого поста.'
      else
        redirect_to @post, alert: 'Не удалось убрать лайк.'
      end
    else
      redirect_to @post, alert: 'Вы не можете удалить чужой лайк.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.post_likes.find_by(user: current_user)
    unless @like
      redirect_to @post
    end
  end
end
