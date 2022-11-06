class OrdersDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end
end
