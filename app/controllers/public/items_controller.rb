class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
  end

  def show
    @cart_item = CartItem.new
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end

end
