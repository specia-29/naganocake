class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def check
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def completion
  end

  def create
    @order = Order.new(order_params)
  end

  def index
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
