class RenderController < ApplicationController
  def index
    @categories = Category.all
  end
end
