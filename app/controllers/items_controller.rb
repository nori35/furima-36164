class ItemsController < ApplicationController
  def index
    @items = Article.order("created_at DESC")
  end


  private

  def items_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
