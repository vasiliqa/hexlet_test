class PostsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?, only: %i[show edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:category, :user).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
    @categories = Category.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def authorize_post
      unless @post.user == current_user
        redirect_to posts_url, alert: 'You are not authorized to perform this action.'
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id, :category_id)
    end
end
