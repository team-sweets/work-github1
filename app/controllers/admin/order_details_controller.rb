class Admin::OrderDetailsController < ApplicationController
 before_action :authenticate_admin!

  def update
    @order = Order.find(params[:order_detail][:order_id])
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update_attribute(:production_status, params[:order_detail][:production_status])
       redirect_to admin_orders_show_path(@order)
    else
       render :show
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status, :product_id, :order_id, :quantity, :purchased_price)
  end


end
