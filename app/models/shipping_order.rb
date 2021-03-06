class ShippingOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token, presence: true
    validates :postal_code,          format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }            #郵便番号
    validates :municipality #市区町村
    validates :address #番地
    validates :phone_number,   numericality:{ only_integer: true,            message: "is invalid. Input half-width characters." } , length: { in:1..11, message: "Must be 11 characters or less" }#電話番号
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" } #都道府県
    

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end


end