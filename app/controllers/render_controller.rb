# frozen_string_literal: true

class RenderController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
  end
end
