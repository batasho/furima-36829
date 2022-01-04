class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :shipping_day
  has_one :purchase
  has_one_attached :image
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,     numericality: { other_than: 1 , message: "can't be blank"},presence: true
  validates :status_id,       numericality: { other_than: 1 , message: "can't be blank"},presence: true
  validates :charge_id,       numericality: { other_than: 1 , message: "can't be blank"},presence: true
  validates :area_id,         numericality: { other_than: 1 , message: "can't be blank"},presence: true
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"},presence: true
  validates :image,           presence: true
  validates :name,            presence: true
  validates :explaration,     presence: true
  validates :price, presence: true, numericality: {only_integer: true,  message: " is invalid. Input half-width characters"}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "is out of setting range"}
end
