class BuyShippingAddresse
  include ActiveModel::Model
  # 必要なカラムを入れていく
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :telephone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :token, presence: true
    validates :user_id, presence: true
    validates :item_id, presence: true

  end
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理を書く
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ShippingAddresse.create(postal_code: postal_code,  shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end