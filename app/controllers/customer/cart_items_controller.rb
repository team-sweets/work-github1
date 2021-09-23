class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @count = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(params_cart_item)
    redirect_to cart_items_path
  end

  def create
    cart_item = CartItem.new(params_cart_item)
    cart_item.customer_id = current_customer.id
   if cart_item.save
    flash[:notice] = "#{cart_item.product.name}をカートに追加しました"
    redirect_to cart_items_path
   else
      @product = Product.find(params[:cart_item][:product_id])
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください"
     render "customer/products/show"
   end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_item = CartItem.all
    cart_item.destroy_all
    redirect_to cart_items_path
  end

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
