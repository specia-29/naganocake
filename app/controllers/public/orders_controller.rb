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
    @order.customer_id = current_customer.id
    @order.save
    # order_detailに保存
    current_customer.cart_items.each do |cart_item| #カート内商品を1つずつ取り出しループ
      @order_detail = OrderDetail.new #初期化宣言
      @order_detail.order_id =  @order.id #order注文idを紐付けておく
      @order_detail.item_id = cart_item.item_id #カート内商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #カート内商品の個数を注文商品の個数に代入
      @order_detail.making_status = 0
      @order_detail.price = cart_item.item.price
      @order_detail.save #注文商品を保存
    end #ループ終わり
        current_customer.cart_items.destroy_all #カートの中身を削除
        redirect_to completion_order_path
  end

  def index
    @order = current_customer.orders
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
		@order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end
