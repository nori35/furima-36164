require 'rails_helper'

RSpec.describe BuyShippingAddresse, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping_addresse = FactoryBot.build(:buy_shipping_addresse, user_id: user.id, item_id: item.id)

    sleep 0.5
  end

  describe "商品購入" do
    context "商品購入できるとき" do
      it "postal_code、shipping_area_id、city、address、building_name、telephone_number、token、user_id、item_idが存在すれば登録できる" do
        expect(@buy_shipping_addresse).to be_valid
      end
      it "postal_codeが半角数字の設定であれば登録できる" do
        @buy_shipping_addresse.postal_code = "123-4567"
        expect(@buy_shipping_addresse).to be_valid
      end
      it "telephone_numberが半角数字でハイフンなし10桁or11桁の設定であれば登録できる" do
        @buy_shipping_addresse.telephone_number = "09012345678"
        expect(@buy_shipping_addresse).to be_valid
      end
      it "building_nameが空の設定でも登録できる" do
        @buy_shipping_addresse.building_name = ""
        expect(@buy_shipping_addresse).to be_valid
      end

    end
    context "出品登録できないとき" do
      it "postal_codeが空だと登録できない" do
        @buy_shipping_addresse.postal_code = nil
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが3桁ハイフン4桁ではないと登録できない" do
        @buy_shipping_addresse.postal_code = "1234567"
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "shipping_area_idが空だと登録できない" do
        @buy_shipping_addresse.shipping_area_id = ""
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_area_idが1だと登録できない" do
        @buy_shipping_addresse.shipping_area_id = "1"
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "cityが空だと登録できない" do
        @buy_shipping_addresse.city = ""
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと登録できない" do
        @buy_shipping_addresse.address = ""
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Address can't be blank")
      end
      it "telephone_numberが空だと登録できない" do
        @buy_shipping_addresse.telephone_number = ""
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "telephone_numberが半角数値でないと登録できない" do
        @buy_shipping_addresse.telephone_number = "０８０１２３４５６７８"
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Telephone number is invalid.")
      end
      it "telephone_numberが10桁以上でないと登録できない" do
        @buy_shipping_addresse.telephone_number = "09876"
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Telephone number is invalid.")
      end
      it "telephone_numberが11桁以内でないと登録できない" do
        @buy_shipping_addresse.telephone_number = "123456789101112"
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Telephone number is invalid.")
      end
      it "tokenが空では登録できないこと" do
        @buy_shipping_addresse.token = nil
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @buy_shipping_addresse.user_id = nil
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @buy_shipping_addresse.item_id = nil
        @buy_shipping_addresse.valid?
        expect(@buy_shipping_addresse.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
