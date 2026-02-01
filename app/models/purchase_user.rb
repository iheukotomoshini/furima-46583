class PurchaseUser < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one :order
end
