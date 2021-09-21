class Customer::CartItemsController < ApplicationController
  
  def my_cart
    @cart_items = current_cart.cart_items.includes([:product])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def add_item
    @cart_item ||= current_cart.cart_items.build(product_id: params[:product_id])
    @cart_item.quantity += params[:quantity].to_i
    if  @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to my_cart_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to product_url(params[:product_id])
    end
  end

  def index
    @cart_items = current_cart.cart_items
  end

  def update
  end

  def create
  end

  def destroy
  end

  def destroy_all
  end
  
  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
