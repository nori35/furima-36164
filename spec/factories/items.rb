FactoryBot.define do
  factory :item do
    title {"テスト"}
    explanation {"問題なし"}
    category_id {2}
    product_condition_id {2}
    shipping_charges_id {2}
    shipping_area_id {2}
    days_to_ship_id {2}
    price {"10000"}
  end
end
