class Customer::OrdersController < ApplicationController
 before_action :authenticate_customer!

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def log

    @cart_items = current_customer.cart_items
    @count = 0

    @order = Order.new(customer: current_customer,
      payment_method: params[:order][:payment_method].to_i
    )


    if params[:order][:addresses] == "residence"
      @order.postage = current_customer.postal_code
      @order.shipping_address     = current_customer.address
      @order.address_name        = current_customer.first_name +
                           current_customer.last_name

    elsif params[:order][:addresses] == "shipping_addresses"
      ship = ShippingAddress.find(params[:order][:shipping_address])
      @order.postage = ship.postal_code
      @order.shipping_address    = ship.address
      @order.address_name        = ship.name

    elsif params[:order][:addresses] == "new_address"
      @order.postage = params[:order][:postal_code]
      @order.shipping_address     = params[:order][:address]
      @order.address_name        = params[:order][:name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    @cart_items = current_customer.cart_items
    if @order.save
       @cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.product_id = cart_item.product.id
       @order_detail.order_id = @order.id
       @order_detail.quantity = cart_item.quantity
       @order_detail.purchased_price = cart_item.product.add_tax_tax_out_price.to_i*cart_item.quantity
       @order_detail.save
     end
      @cart_items.destroy_all
    @order.save
    #adress = ShippingAddress.new(shipping_parameter)

    flash[:notice] = "ご注文が確定しました。"
    redirect_to thanx_path

    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(address_params)
    end
  end

  def thanx
  end

  def index
    @o = current_customer.orders
    @orders = @o.reverse
  end

  def show
    @order = Order.find(params[:id])
  end

 private

  def order_params
    params.require(:order).permit( :address_name, :shipping_address, :shipping_postal_code, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def to_log
    redirect_to customers_cart_items_path if params[:id] == "log"
  end
  end
end