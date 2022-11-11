class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path(@address)
    else
      redirect_to new_admin_item_path
    end
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:item).permit(:customer_id, :name, :postal_code, :address)
  end

end
