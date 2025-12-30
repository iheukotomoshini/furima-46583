require 'rails_helper'

RSpec.describe Furima, type: :model do
  
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe "Furima新規登録" do
    context "登録できるとき" do
      it "Furima登録ができるとき" do
        expect(@furima).to be_valid
      end
    end
    context "登録できないとき" do
      it "imageが空では登録できない" do
        @furima.image = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @furima.title = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Title can't be blank")
      end
      it "explanationが空では登録できない" do
        @furima.explanation = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空では登録できない" do
        @furima.category_id = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1では登録できない" do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空では登録できない" do
        @furima.status_id = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Status can't be blank")
      end
      it "status_idが1では登録できない" do
        @furima.status_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_fee_status_idが空では登録できない" do
        @furima.shipping_fee_status_id = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it "shipping_fee_status_idが1では登録できない" do
        @furima.shipping_fee_status_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @furima.prefecture_id = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "scheduled_delivery_idが空では登録できない" do
        @furima.scheduled_delivery_id = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it "scheduled_delivery_idが1では登録できない" do
        @furima.scheduled_delivery_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it "priceが空では登録できない" do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end
      it "全角文字や半角アルファベットを含むpriceでは登録できない" do
        @furima.price = "12345６"
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300円未満では登録できない" do
        @furima.price = "10"
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999円より大きい場合は登録できない" do
        @furima.price = "100000000"
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "userが紐づいていないと登録できない" do
        @furima.user = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("User must exist")
      end
    end
  end
end
