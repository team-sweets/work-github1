class Customer::ShippingAddressesController < ApplicationController
 before_action :authenticate_customer!

  def index
    @shipping_addresses = current_customer.shipping_addresses
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to shipping_addresses_path
      flash[:notice_shipping_address] = "新しく住所が追加されました"
    else
      @shipping_addresses = ShippingAddress.all
      render :index
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    @shipping_addresses = ShippingAddress.all
    redirect_to shipping_addresses_path
    flash[:notice_shipping_address] = "選択した住所が1件削除されました"
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
      flash[:notice_shipping_address] = "編集内容が正しく更新されました"
    else
      render :edit
    end
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:customer_id, :postal_code, :address, :name)
  end

end
