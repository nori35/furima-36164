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
        @item.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "category_idが空では登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "product_condition_idが空では登録できない" do
        @user.email = "test1234test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "shipping_charges_idが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "shipping_area_idが空だと登録できない" do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "days_to_ship_idが空だと登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end 
      it "priceが空だと登録できない" do
        @user.password = "sp123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end