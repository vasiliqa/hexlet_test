# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_like, only: [:destroy]

  def create
    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def destroy
    if @like.user == current_user
      if @like.destroy
        redirect_to @post
      else
        redirect_to @post
      end
    else
      redirect_to @post
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find_by(user: current_user)
    return if @like

    redirect_to @post
  end
end
