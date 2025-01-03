# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: I18n.t('flash.create', model: @category.class.name) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
