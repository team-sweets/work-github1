class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def quit
  end

  def out
  end

  def edit
    @customer = current_customer
  end

  def update
  end

  private
  def customer_params
    params.require(:cusomer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number)
  end
end