class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def set_id
    @category = Category.find_by_id(params[:id].to_i)
    if @category
      render json: @category.to_json and return if request.xhr?
    else
      render nothing: true
    end
  end
end
