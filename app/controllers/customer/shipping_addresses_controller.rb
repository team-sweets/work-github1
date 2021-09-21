class Customer::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to shipping_addresses_path
      flash[:notice] = "新たに住所が追加されました。"
    else
      @shipping_address = ShippingAddress.all
      render :index
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:customer_id, :postal_code, :address, :name)
  end

end
