class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :image, :title, :explanation, :price, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: {with: /\A[0-9]+\z/, message: "には半角数字を設定してください"}

end