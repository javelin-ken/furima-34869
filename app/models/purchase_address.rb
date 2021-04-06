class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city_town_village, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_town_village
    validates :address 
    validates :phone_number,format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :shipping_origin_id, numericality: { other_than: 1, only_integer: true, message: 'Select' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city_town_village: city_town_village, address: address,  building: building, shipping_origin_id: shipping_origin_id, phone_number: phone_number, purchase_id: purchase.id)
  end
end