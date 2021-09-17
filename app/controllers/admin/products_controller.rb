class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path
  end

  def show
  end

  def edit
  end

  def update
  end
end
