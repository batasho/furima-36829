require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる時" do
      it "nicknameとemailとpassword,password_confirmationとfirst_name,last_name,kfirst_name,klast_name,birthdayが存在すれば登録できる"do
      expect(@user).to be_valid
      end
    end
    context "新規登録できない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "kfirst_nameが空だと登録できない" do
        @user.kfirst_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kfirst name can't be blank")
      end
      it "klast_nameが空だと登録できない" do
        @user.klast_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Klast name can't be blank")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが5文字以下では登録できない"do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
