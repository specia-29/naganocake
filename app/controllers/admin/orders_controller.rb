class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      @orders = order.all
      render 'edit'
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
