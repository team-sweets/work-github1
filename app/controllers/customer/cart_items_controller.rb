class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :cart_item_check, only: [:create, :update]



  def index
    @cart_items = current_customer.cart_items
    @count = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(params_cart_item)
     flash[:update] = "#{cart_item.product.name}を#{cart_item.quantity}個に変更しました!"
     redirect_to cart_items_path
    end
  end

  def create
    cart_item = CartItem.new(params_cart_item)
    cart_item.customer_id = current_customer.id
   if cart_item.save
    flash[:success] = "#{cart_item.product.name}をカートに#{cart_item.quantity}個追加しました!"
    redirect_to cart_items_path
   else
      @product = Product.find(params[:cart_item][:product_id])
      @cart_item = CartItem.new
   end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
     flash[:destroy] = "#{cart_item.product.name}を削除しました!"
     redirect_to cart_items_path
    end
  end

  def destroy_all
    cart_item = CartItem.all
    if cart_item.destroy_all
     flash[:destroy_all] = "カートを空にしました!"
     redirect_to cart_items_path
    end
  end

  private

  def cart_item_check
    if params[:cart_item][:quantity].empty?
      flash[:alert] = "※ 個数を選択してください"
      redirect_to products_show_path((params[:cart_item][:product_id]).to_i)
    end
  end


  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
