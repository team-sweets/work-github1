class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!
  
  def top
    @orders = Order.page(params[:page]).per(10)
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attribute(:orders_status, order_params[:orders_status])
      flash[:success] = "注文ステータスを変更しました"
       redirect_to admin_orders_show_path(@order)
    else
        render :show
    end
  end

  private
  def order_params
    params.require(:order).permit( :orders_status)
  end

end