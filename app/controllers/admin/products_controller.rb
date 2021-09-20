class Admin::ProductsController < ApplicationController

def index

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path(@product.id)
  end

  def show
  @product = Product.find(params[:id])
  @product_new = Product.new
  end

  def edit
  end

  def update
  end

  private

  def product_params
   params.require(:product).permit(:image, :name, :description, :genre_id, :tax_out_price, :sales_status)
  end
end