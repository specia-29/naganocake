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
    if params[:order][:address_select] == "default"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_select] == "list"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_select] == "new"
      @address = Address.new
      @address.customer_id = current_customer.id
      @address.postal_code = (params[:order][:postal_code])
      @address.address = (params[:order][:address])
      @address.name = (params[:order][:name])
      @address.save
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  def completion
  end

  def create
    @order = Order.new(order_params)
    @cart_item.save
    redirect_to completion_order_path
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
