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
  end

  def show
  end
end
