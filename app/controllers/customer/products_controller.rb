class Customer::ProductsController < ApplicationController
  def top
  end

  def about
  end

  def index
    @products = Product.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end
