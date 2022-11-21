class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(created_at: :desc)
    # @items = Item.order(Arel.sql("created_at: :desc")).params[:page].per(4)
  end

  def about
  end

  def show
  end
end
