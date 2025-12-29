class Furima < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  validates :title, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
end


