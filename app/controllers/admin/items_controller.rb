class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
  end

end
