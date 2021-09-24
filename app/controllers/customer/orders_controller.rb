class Customer::OrdersController < ApplicationController
  def new
  end

  def log
    @cart_items = CartItem.all
    @count = 0
  end

  def create
  end

  def thanx
  end

  def index
    @order_details = OrderDetail.all
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
end
