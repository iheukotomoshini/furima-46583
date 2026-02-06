require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    furima = FactoryBot.create(:furima)
    purchase_user = FactoryBot.create(:purchase_user, user: user, furima: furima)
    #purchase_user = FactoryBot.create(:purchase_user)
    @order = FactoryBot.build(:order, purchase_user_id: purchase_user.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角の3桁ハイフン4桁でないと保存できないこと' do
        @order.postal_code = '123-567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code は半角数字3桁+'-'4桁数字の形式で入力してください")
      end
      it "全角文字や半角アルファベットを含むpostal_codeでは登録できない" do
        @order.postal_code = "12345６"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is not a number")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order.addresses = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'buildingが空だと保存できないこと' do
        @order.building = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Building can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "全角文字や半角アルファベットを含むphone_numberでは登録できない" do
        @order.phone_number = "12345６7890"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a number")
      end
      it "10桁以上11桁以内の半角数値のphone_numberでないと登録できない" do
        @order.phone_number = "12345"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください")
      end
      it 'purchase_userが紐付いていないと保存できないこと' do
        @order.purchase_user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchase user must exist")
      end
    end
  end
end
