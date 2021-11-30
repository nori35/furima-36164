require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context "出品登録できるとき" do
      it "title、explanation、category_id、product_condition_id、shipping_charges_id、shipping_area_id、days_to_ship_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context "出品登録できないとき" do
      it "imageが空だと登録できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it "titleが空だと登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "product_condition_idが空では登録できない" do
        @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "shipping_charges_idが空だと登録できない" do
        @item.shipping_charges_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it "shipping_area_idが空だと登録できない" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "days_to_ship_idが空だと登録できない" do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end 
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end