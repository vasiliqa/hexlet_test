class User::RenderController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
  end
end
