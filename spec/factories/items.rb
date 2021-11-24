FactoryBot.define do
  factory :item do
    title {"テスト"}
    explanation {"問題なし"}
    category_id {Category.all.sample}
    product_condition_id {ProductCondition.all.sample}
    shipping_charges_id {ShippingCharges.all.sample}
    shipping_area_id {ShippingArea.all.sample}
    days_to_ship_id {DaysToShip.all.sample}
    price {"10000"}
  end
end
