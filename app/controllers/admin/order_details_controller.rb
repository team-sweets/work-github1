class Admin::OrderDetailsController < ApplicationController
 before_action :authenticate_admin!
  
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_top_path(@order_detail)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end


end
