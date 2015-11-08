class CategoriesController < ApplicationController
  before_action :set_categories, only: %i(index create destroy)

  def index
    @category = Category.first || Category.new
  end

  def create
    @category = Category.find_by(id: params[:category][:id]) || Category.new
    @category.update_attributes(category_params)
  end

  def destroy
    @category = Category.find_by(id: params[:id]).destroy
  end

  def set_form
    @category = Category.find_by(id: params[:id])
    if @category
      render json: @category and return if request.xhr?
    else
      render json: { id: Category.new_id } and return request.xhr?
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:number, :name, :color)
  end
end
