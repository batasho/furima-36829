class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipality , :address, :building, :phone, :user, :item, :order

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    #購入履歴を保存する
    order = Order.create(user: user, item: item)
    #住所を保存する
    Buyer.create(postal: postal, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, order_id: order.id)
  end
end