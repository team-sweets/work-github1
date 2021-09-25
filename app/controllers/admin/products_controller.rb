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
   flash[:success] = "新商品を登録しました!"
   redirect_to admin_products_path(@product.id)
  else
   render :new
  end
 end

 def show
  @product = Product.find(params[:id])
  @cart_item = CartItem.new
 end

 def edit
  @product = Product.find(params[:id])
 end

 def update
   @product = Product.find(params[:id])
  if @product.update(product_params)
   flash[:success] = "商品内容を変更しました!"
   redirect_to admin_product_path(@product)
  else
   render :edit
  end
 end

 private

  def product_params
   params.require(:product).permit(:image, :name, :description, :genre_id, :tax_out_price, :sales_status)
  end
end