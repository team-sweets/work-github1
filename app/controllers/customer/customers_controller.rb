class Customer::CustomersController < ApplicationController
 before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def edit
    @customer = current_customer
  end

  def update
      @cusomer = current_customer
    if @cusomer.update(customer_params)
      redirect_to customers_path
      flash[:notice_customer] = "会員情報が更新されました。"
    else
      @customer = current_customer
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email)
  end
end