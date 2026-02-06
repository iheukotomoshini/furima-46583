require 'rails_helper'

RSpec.describe PurchaseUser, type: :model do
  before do
    user = FactoryBot.create(:user)
    furima = FactoryBot.create(:furima)
    @purchase_user = FactoryBot.build(:purchase_user, user: user, furima: furima)
  end
  
  describe '購入者情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'userが紐付いていないと保存できないこと' do
        @purchase_user.user = nil
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("User must exist")
      end
      it 'furimaが紐付いていないと保存できないこと' do
        @purchase_user.furima = nil
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Furima must exist")
      end
    end
  end
end
