class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    products = Product.all
    render json: { data: products, message: 'Products details' }, status: :ok
  end

  def show
    render json: { data: @product, message: 'Product details' }, status: :ok
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: { data: product, message: 'Product created successfully' }, status: :created
    else
      render json: { error: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: { data: @product, message: 'Product updated successfully' }, status: :ok
    else
      render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    render json: { message: 'Product deleted successfully' }, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue => e
    render json: { errors: e.message }
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :product_cost, :categories_id, images: [])
  end
end
