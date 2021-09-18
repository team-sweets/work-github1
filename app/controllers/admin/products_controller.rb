class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(product.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def product_params
   params.require(:product).permit(:image, :title, :description, :genre, :tax_out_price)
  end
end