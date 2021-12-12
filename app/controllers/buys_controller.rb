class BuysController < ApplicationController
  def index
    @buy = Buy.all.order(created_at: :desc)
  end

  def create
  end
  def create
    @buy_shipping_addresse = BuyShippingAddresse.new(buy_params)
    binding.pry
    if @buy_shipping_addresse.valid?
       @buy_shipping_addresse.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :telephone_number, :item_id)
  end
end
