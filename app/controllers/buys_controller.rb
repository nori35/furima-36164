class BuysController < ApplicationController
  def index
    @buy = Buy.all.order(created_at: :desc)
  end

  def create
    #binding.pry
    @buy_shipping_addresse = BuyShippingAddresse.new(buy_params)
    if @buy_shipping_addresse.valid?
       @buy_shipping_addresse.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :telephone_number, :item_id).merge(user_id: current_user.id)
  end
end