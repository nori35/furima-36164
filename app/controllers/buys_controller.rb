class BuysController < ApplicationController
  def index
    @buy = Buy.all.order(created_at: :desc)
    @buy_shipping_addresses = BuyShippingAddresse.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_shipping_addresses = BuyShippingAddresse.new(buy_params)
    if @buy_shipping_addresses.valid?
      pay_item
      @buy_shipping_addresses.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping_addresse).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :telephone_number, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_050f9d142d7918a0d599157a"
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
