class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    # binding.pry
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :title, :explanation, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
