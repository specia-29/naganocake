class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order_detail.order.id)
      flash[:notice_update] = "ステータス情報を更新しました！"
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end
end