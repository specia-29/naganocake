class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(created_at: :desc)
  end

  def about
  end

  def show
  end
end
