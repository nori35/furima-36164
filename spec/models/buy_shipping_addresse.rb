require 'rails_helper'

RSpec.describe BuyShippingAddresse, type: :model do
  before do
    @buy_shipping_addresse = FactoryBot.build(:buy_shipping_addresse)
  end

  describe "商品購入" do
    context "商品購入できるとき" do
      it "postal_code、shipping_area_id、city、address、telephone_numberが存在すれば登録できる" do
        expect(@buy_shipping_addresse).to be_valid
      end
      it "postal_codeが半角数字の設定であれば登録できる" do
        @buy_shipping_addresse.postal_code = "123-4567"
        expect(@buy_shipping_addresse).to be_valid
      end
      it "telephone_numberが半角数字の設定であれば登録できる" do
        @buy_shipping_addresse.telephone_number = "09012345678"
        eexpect(@buy_shipping_addresse).to be_valid
      end

    end
  end
end