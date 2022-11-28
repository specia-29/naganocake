class Public::CartItemsController < ApplicationController


  def index
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
    # カートに入っている商品の合計金額
    # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }

  end

  def update
  end

  def destroy
    @cart_item = current_customer.cart_items
    @cart_item.destroy
    redirect_to cart_item_path
  end

  def destroy_all
    @cart_item_all = CartItem.all
    @cart_item_all.destroy
  end

  def create
    @genres = Genre.all
    @items = Item.page(params[:page])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "#{@cart_item.item.name}をカートに追加しました。"
      redirect_to cart_items_path
    else
      render "public/items/index"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end