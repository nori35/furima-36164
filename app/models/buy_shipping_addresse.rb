class BuyShippingAddresse
  include ActiveModel::Model
  # 必要なカラムを入れていく
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :telephone, :number, :buy

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :building_name
    validates :telephone
    validates :number
    validates :buy
  end
  validates :hipping_area_id, numericality: { other_than: 1 , message: "can't be blank"} 

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end