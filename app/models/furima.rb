class Furima < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank", only_integer: true}
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank", only_integer: true}
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank", only_integer: true}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank", only_integer: true}
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank", only_integer: true}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true}

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fee, foreign_key: :shipping_fee_status_id
  belongs_to_active_hash :genre, foreign_key: :category_id
  belongs_to_active_hash :status, foreign_key: :status_id
  belongs_to_active_hash :prefecture, foreign_key: :prefecture_id
  belongs_to_active_hash :scheduled_delivery, foreign_key: :scheduled_delivery_id

end

