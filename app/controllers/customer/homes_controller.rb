class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.all.order(created_at: :desc)
    @products = Product.all.order(created_at: :desc)
  end

  def about
  end

end
