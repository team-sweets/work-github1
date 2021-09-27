class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update_attribute(:production_status, params[:production_status])
       redirect_to admin_orders_show_path(@order_detail)
    else
       render :show
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end


end
