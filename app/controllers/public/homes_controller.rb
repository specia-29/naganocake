class Public::HomesController < ApplicationController

  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_customer!

  def top
    @genres = Genre.all
    @items = Item.order(created_at: :desc).limit(4).where(is_active: 'false')
    # 新着順・4件のみ表示
  end

  def about
  end

  def show
  end
end