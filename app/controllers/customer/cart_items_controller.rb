class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def create
  　@cart_items = @CartItems
  end

  def destroy
    cart_item = CartItem.find(params[:id])  
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end
  
  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
