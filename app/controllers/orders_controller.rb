class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    orders = Order.all
    render json: { data: orders, message: 'Orders details' }, status: :ok
  end

  def show
    render json: { data: @order, message: 'Order details' }, status: :ok
  end

  def create
    order = Order.new(order_params)
    if order.save
      render json: { data: order, message: 'Order created successfully' }, status: :created
    else
      render json: { error: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: { data: @order, message: 'Order updated successfully' }, status: :ok
    else
      render json: { error: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    render json: { message: 'Order deleted successfully' }, status: :ok
  end

  private

  def set_order
    @order = Order.find(params[:id])
  rescue => e
    render json: { errors: e.message }
  end

  def order_params
    params.require(:order).permit(:order_id, :status, :amount, :product_id, :user_id)
  end
end
