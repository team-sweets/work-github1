class Customer::CustomersController < ApplicationController
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
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number)
  end
end