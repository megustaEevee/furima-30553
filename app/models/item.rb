class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchaser

  has_one_attached :image

  validates :name,                   presence: true
  validates :info,                   presence: true
  validates :category_id,            presence: true, numericality: { other_than: 1 }
  validates :sales_status_id,        presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_source_id,   presence: true, numericality: { other_than: 0 }
  validates :scheduled_delivery_id,  presence: true, numericality: { other_than: 1 }
  validates :price,                  presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :salesstatus
  belongs_to_active_hash :shippingfeestatus
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduleddelivery

end
