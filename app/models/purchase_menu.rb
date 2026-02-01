class PurchaseMenu
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token, :furima_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :furima_id
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は半角数字3桁+'-'4桁数字の形式で入力してください" }  
    validates :city, presence: :true
    validates :addresses, presence: :true
    validates :building, presence: :true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の半角数字で入力してください" }
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank", only_integer: true}

  def save
    purchase_user = PurchaseUser.create(user_id:, furima_id:)
    Order.create(postal_code:, prefecture_id:, city:, addresses:, building:, phone_number:, purchase_user_id: purchase_user.id)
  end

end