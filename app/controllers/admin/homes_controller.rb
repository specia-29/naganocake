class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @orders = Order.page(params[:page]).limit(10)
  end


end
