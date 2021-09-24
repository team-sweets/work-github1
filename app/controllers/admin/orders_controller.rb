class Admin::OrdersController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end

  def update
    @order = Order.find(params[:id])
    if  @order.update(order_params)
        redirect_to admin_top_path(@order)
    else
        render show
  end

  private
  def order_params
    params.require(:order).permit(:address_name, :created_at, :shipping_postal_code, :shipping_address, :address_name, :payment_method, :orders_status)
  end

end
