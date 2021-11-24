class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:content, :image, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :bays_to_ship_id).merge(user_id: current_user.id)
  end
end
