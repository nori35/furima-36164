class BuysController < ApplicationController
  def index
    @buy = Buy.all.order(created_at: :desc)
  end

  def create
  end
  def create
    @buy_shipping_addresse = BuyShippingAddress.new(buy_params)
    if @buy_address.valid?
       @buy_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id)
  end
end
