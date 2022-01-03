require 'rails_helper'

RSpec.describe ShippingAddresse, type: :model do
  before do
    @shipping_addresse = FactoryBot.build(:shipping_addresse)
  end

  describe "商品購入" do
    context "商品購入できるとき" do
      it "postal_code、shipping_area_id、city、address、telephone_numberが存在すれば登録できる" do
        expect(@shipping_addresse).to be_valid
      end
      it "postal_codeが半角数字の設定であれば登録できる" do
        @shipping_addresse.postal_code = "123-4567"
        expect(@shipping_addresse).to be_valid
      end
      it "telephone_numberが半角数字の設定であれば登録できる" do
        @shipping_addresse.telephone_number = "09012345678"
        eexpect(@shipping_addresse).to be_valid
      end

    end
  end
end
