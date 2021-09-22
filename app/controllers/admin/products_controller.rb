class Admin::ProductsController < ApplicationController
  def index
   @products = Product.page(params[:page]).per(10)
  end

 def new
  @product = Product.new
 end

 def create
  @product = Product.new(product_params)
  if @product.save
  redirect_to admin_products_path(@product.id)
  else
   render :new
  end
 end

 def show
  @product = Product.find(params[:id])
  @product_new = Product.new
 end

 def edit
  @product = Product.find(params[:id])
 end

 def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  redirect_to admin_product_path(@product)
 end

 private

  def product_params
   params.require(:product).permit(:image, :name, :description, :genre_id, :tax_out_price, :sales_status)
  end
end