class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    categories = Category.all
    render json: { data: categories, message: 'Categories details' }, status: :ok
  end

  def show
    render json: { data: @category, message: 'Category details' }, status: :ok
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: { data: category, message: 'Category created successfully' }, status: :created
    else
      render json: { error: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: { data: @category, message: 'Category updated successfully' }, status: :ok
    else
      render json: { error: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    render json: { message: 'Category deleted successfully' }, status: :ok
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue => e
    render json: { errors: e.message }
  end

  def category_params
    params.require(:category).permit(:category_name, :image)
  end
end
