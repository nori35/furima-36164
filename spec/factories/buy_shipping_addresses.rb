FactoryBot.define do
  factory :buy_shipping_addresse do
    postal_code {"123-4567"}
    shipping_area_id {"2"}
    city {"札幌市"}
    address {"西1-1"}
    building_name {"スカイハイツ"}
    telephone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end