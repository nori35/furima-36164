class ItemsController < ApplicationController
  def index
    @items = Article.order("created_at DESC")
  end

  def new
    @item = Article.new
  end

  def create
    @article = Article.new(article_params)
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
