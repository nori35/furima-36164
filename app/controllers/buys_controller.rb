class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :prevent_url, only: [:index]
  before_action :contributor_confirmation, only: [:index]

  def index
    @buy = Buy.all.order(created_at: :desc)
    @buy_shipping_addresses = BuyShippingAddresse.new
  end

  def create
    @buy_shipping_addresses = BuyShippingAddresse.new(buy_params)
    if @buy_shipping_addresses.valid?
      Payjp.api_key = "sk_test_050f9d142d7918a0d599157a"
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
    if @item.user_id != current_user.id
    redirect_to root_path
    end
  end

  def contributor_confirmation
    if current_user == @item.user
    redirect_to root_path 
    end
  end

end