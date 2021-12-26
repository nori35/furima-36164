class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :prevent_url, only: [:index]

  def index
    @buy = Buy.all
    @buy_shipping_addresses = BuyShippingAddresse.new
  end

  def create
    @buy_shipping_addresses = BuyShippingAddresse.new(buy_params)
    if @buy_shipping_addresses.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy')
      @buy_shipping_addresses.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping_addresse).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :telephone_number).merge(item_id: @item.id, token: params[:token], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.buy != nil
    redirect_to root_path
    end
  end

end