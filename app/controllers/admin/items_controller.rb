class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      redirect_to new_admin_item_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admin_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :price_without_tax, :image, :is_sales_status)
  end

end
