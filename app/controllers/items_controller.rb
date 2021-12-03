class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :title, :explanation, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
