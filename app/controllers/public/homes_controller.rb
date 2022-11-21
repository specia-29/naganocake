class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).limit(4)
    # 新着順・4件のみ表示
  end

  def about
  end

  def show
  end
end
