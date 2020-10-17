class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building, :phone_number 

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses 
    validates :phone_number, length: { maximum: 11 }
  end

  def save
    purchaser = Purchaser.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, purchaser_id: purchaser.id)
  end
end