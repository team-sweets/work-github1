class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_top_path(@order_detail)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:)
  end


end
