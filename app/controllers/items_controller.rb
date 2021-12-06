class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :contributor_confirmation, only: [:edit, :update]

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :title, :explanation, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end
end
