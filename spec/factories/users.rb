FactoryBot.define do
  factory :user do
    nickname {"テスト"}
    email {Faker::Internet.free_email}
    password {"sp123456"}
    password_confirmation {"sp123456"}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {"2000-01-01"}
  end
end