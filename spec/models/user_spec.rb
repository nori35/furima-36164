require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上の英字と数字の両方を含めて設定であれば登録できる" do
        @user.password = "sp123456"
        @user.password_confirmation = "sp123456"
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "メールアドレスに＠が含まれないと登録できない" do
        @user.email = "test1234test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが６文字以上でないと登録できない" do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが半角英数字混合でないと登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end 
      it "パスワードとパスワード(確認)が一致でないと登録できない" do
        @user.password = "sp123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "お名前（全角）は、名字が必須" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "お名前（全角）は、名前が必須" do
        @user.first_name = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必須" do
        @user.last_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters.")
      end
      it "名前（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必須" do
        @user.first_name = "tarou"
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "お名前カナ（全角）は、名字が必須" do 
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "お名前カナ（全角）は、名前が必須" do 
        @user.first_name_kana = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "お名前カナ（全角）は、全角（カタカナ）での入力が必須" do 
        @user.last_name_kana = "山田"
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.",
          "First name kana is invalid. Input full-width katakana characters.")
      end
      it "生年月日は必須" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end