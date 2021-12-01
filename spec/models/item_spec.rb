require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context "出品登録できるとき" do
      it "image、title、explanation、category_id、product_condition_id、shipping_charges_id、shipping_area_id、days_to_ship_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字の設定であれば登録できる" do
        @item.price = "10000"
        expect(@item).to be_valid
      end
    end
    context "出品登録できないとき" do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
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
      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "product_condition_idが空では登録できない" do
        @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "product_condition_idが1では登録できない" do
        @item.product_condition_id = "1"
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
      it "価格は半角数値ののみでないとないと保存できない" do
        @item.price = "１２３４５６"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格は¥300~¥9,999,999の間でないとないと保存できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格は¥300~¥9,999,999の間でないとないと保存できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end
  end
end