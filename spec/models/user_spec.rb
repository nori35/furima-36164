require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "メールアドレスが一意性でないと登録できない" do
    end
    it "メールアドレスに＠が含まれないと登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードが６文字以上でないと登録できない" do
    end
    it "パスワードが半角英数字混合でないと登録できない" do
    end 
    it "パスワードとパスワード(確認)が一致でないと登録できない" do
    end
    it "お名前（全角）は、名字と名前がそれぞれ必須" do
    end
    it "お名前（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必須" do  
    end
    it "お名前カナ（全角）は、名字と名前がそれぞれ必須" do 
    end
    it "お名前カナ（全角）は、全角（カタカナ）での入力が必須" do   
    end
    it "生年月日は必須" do
    end
  end
end