class BuyerPurchase
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipality , :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "input only number"}
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :area_id, presence: true
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    #購入履歴を保存する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    #住所を保存する
    Buyer.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, purchase_id: purchase.id)
  end
end