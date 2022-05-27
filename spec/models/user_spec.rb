require 'rails_helper'

RSpec.describe User,type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    it '各カラムが正常に入力されれば、登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwaordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'last_nameは全角文字でなければならない' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameは全角文字でなければならない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_name_kanaは全角カナ文字でなければならない' do
      @user.last_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'first_name_kanaは全角カナ文字出なければならない' do
      @user.first_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが6文字以上でなければ登録できない' do
      @user.password = 'a1'
      @user.password_confirmation = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'aaaa1111'
      @user.password_confirmation = 'bbbb1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordを英字のみでは登録できない' do
      @user.password = 'aaaacccc'
      @user.password_confirmation = 'aaaacccc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordを数字のみでは登録できない' do
      @user.password = '11112222'
      @user.password_confirmation = '11112222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '全角文字を含むpasswordでは登録できない' do
      @user.password = 'あああいいい'
      @user.password_confirmation = 'あああいいい'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
end
