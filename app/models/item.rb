class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "must be selected" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_of_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than: 299, less_than_or_equal_to: 9999999, only_integer: true, message: "must be a valid number" }

  belongs_to :user
  #has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge, class_name: 'ShippingCharge'
  belongs_to :region_of_origin
  belongs_to :day_to_ship, class_name: 'DayToShip'
end