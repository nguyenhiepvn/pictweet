require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end 
  
  describe 'ユーザー新規登録' do

    context '新規登録できるとき'do
    puts I18n.t('devise.failure.email_invalid')

      it 'nicknameとemail,passwordとpassword_confirmationが存在すれば登録できる' do
      end 
    end 

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end 

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = "123123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'nicknameが七文字以上では登録できない' do 
        @user.nickname = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
      end 

      it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは＠を含まないと登録できない'do
         @user.email = "testemaffffil"
         @user.valid?
         binding.pry
         expect(@user.errors.full_messages).to include("Email is not a valid email format. Please provide a valid email address.") 
      end

      it 'passwordが空では登録できない' do
         @user.password = ""
         @user.valid?
         expect(@user.errors.full_messages).to include "Password can not black"
      end

      it 'passwordが五文字以下では登録できない'do
        @user.password = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimun is 6 characters)"
      end

      it 'passwordが百二十九文字以上では登録できない'do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (manimun is 129 characters)"
      end

    end
  end
end