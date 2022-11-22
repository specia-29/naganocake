class Admin::HomesController < ApplicationController

  # before_action :authenticate_admin!

  def top
    @order = Order.find(params[:id])
    @orders = Order.all
  end


end
