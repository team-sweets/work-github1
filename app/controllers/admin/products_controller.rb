class Admin::ProductsController < ApplicationController
  def index
     @products = Product.all.page(params[:page]).per(10)
  end

  def new
  end

  def create
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end
end
