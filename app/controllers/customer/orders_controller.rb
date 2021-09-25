class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def log

    @cart_items = CartItem.all
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
      ship = ShippingAddress.find(params[:shipping_address_id])
      @order.postage = ship.postal_code
      @order.shipping_address     = ship.address
      @order.address_name        = ship.name

    elsif params[:order][:addresses] == "new_address"
      @order.postage = params[:order][:postal_code]
      @order.shipping_address     = params[:order][:address]
      @order.address_name        = params[:order][:name]
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    #adress = ShippingAddress.new(shipping_parameter)

    flash[:notice] = "ご注文が確定しました。"
    redirect_to thanx_customers_orders_path

    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(address_params)
    end
  end

  def thanx
  end

  def index
    @order_details = OrderDetail.all
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

 private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def to_log
    redirect_to customers_cart_items_path if params[:id] == "log"
  end
end