class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @addresses = current_customer.address
  end

  def check
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
    @total = 0
    # @order = Order.find(order_params)
  end

  def completion
  end

  def create
  end

  def index
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
