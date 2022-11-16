class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def check
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
  end

  def completion
  end

  def create
  end

  def index
  end

  def show
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
