require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context "登録できるとき" do
      it "ユーザー登録ができる" do
        user = User.new(nickname: "kuma", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
      end
    end
    context "登録できないとき" do
      it "nicknameが空では登録できない" do
        user = User.new(nickname: "", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        user = User.new(nickname: "kuma", email: "", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
       # user = User.create(nickname: "kuma", email: "", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@がない場合は登録できない" do
        user = User.new(nickname: "kuma", email: "testtest", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        user = User.new(nickname: "kuma", email: "test@test", password: "", password_confirmation: "", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下では登録できない" do
        user = User.new(nickname: "kuma", email: "test@test", password: "1234a", password_confirmation: "1234a", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが一致しない場合は登録できない" do
        user = User.new(nickname: "kuma", email: "test@test", password: "1234ab", password_confirmation: "1234aa", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
      it "family_nameが空では登録できない" do
        user = User.new(nickname: "kuma", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Family name can't be blank")
      end
      it "last_nameが空では登録できない" do
        user = User.new(nickname: "", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it "family_name_kanaが空では登録できない" do
        user = User.new(nickname: "", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "", last_name_kana: "タロウ", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        user = User.new(nickname: "", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "", birthday: 1990-01-01)
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        user = User.new(nickname: "", email: "test@test", password: "1234ab", password_confirmation: "1234ab", family_name: "山田", last_name: "太郎", family_name_kana: "ヤマダ", last_name_kana: "タロウ", birthday: "")
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
