require 'rails_helper'

RSpec.describe PurchaseMenu, type: :model do
  before do
    user = FactoryBot.create(:user)
    furima = FactoryBot.create(:furima)
    @purchase_menu = FactoryBot.build(:purchase_menu, user_id: user.id, furima_id: furima.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_menu).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_menu.building = ""
        expect(@purchase_menu).to be_valid
      end
    end

    context '内容に問題がある場合' do
        it 'tokenが空だと保存できないこと' do
        @purchase_menu.token = ''
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_menu.postal_code = ''
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_menu.postal_code = '1234567'
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Postal code は半角数字3桁+'-'4桁数字の形式で入力してください")
      end
      it 'postal_codeが半角の3桁ハイフン4桁でないと保存できないこと' do
        @purchase_menu.postal_code = '123-567'
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Postal code は半角数字3桁+'-'4桁数字の形式で入力してください")
      end
      it "全角文字や半角アルファベットを含むpostal_codeでは登録できない" do
        @purchase_menu.postal_code = "12345６"
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Postal code は半角数字3桁+'-'4桁数字の形式で入力してください")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_menu.prefecture_id = ''
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @purchase_menu.prefecture_id = 1
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_menu.city = ''
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @purchase_menu.addresses = ''
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_menu.phone_number = ''
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Phone number can't be blank")
      end
      it "全角文字や半角アルファベットを含むphone_numberでは登録できない" do
        @purchase_menu.phone_number = "12345６7890"
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください")
      end
      it "9桁以下のphone_numberでは登録できない" do
        @purchase_menu.phone_number = "12345"
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください")
      end
      it "12桁以上のphone_numberでは登録できない" do
        @purchase_menu.phone_number = "123456789101112"
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Phone number は10桁または11桁の半角数字で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_menu.user_id = nil
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("User can't be blank")
      end
      it 'furimaが紐付いていないと保存できないこと' do
        @purchase_menu.furima_id = nil
        @purchase_menu.valid?
        expect(@purchase_menu.errors.full_messages).to include("Furima can't be blank")
      end
    end
  end
end
