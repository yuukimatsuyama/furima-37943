require 'rails_helper'

RSpec.describe BuyingItemShipping, type: :model do
 before do
  item = FactoryBot.create(:item)
  @buying_item_shipping = FactoryBot.build(:buying_item_shipping,item_id: item.id,user_id: item.user.id)
  sleep 0.5
 end
 describe '購入情報の保存' do
  context '商品が購入できる' do
    it '各カラムが正常に入力されれば、商品が購入できる' do
      expect(@buying_item_shipping).to be_valid
    end
    it 'building_nameが空でも、商品が購入できる' do
      @buying_item_shipping.building_name = ''
      @buying_item_shipping.valid?
      expect(@buying_item_shipping).to be_valid
    end
  end
  context '商品が購入できない' do
    it 'address_numberが空では登録できない' do
      @buying_item_shipping.address_number = ''
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Address number can't be blank")
    end
    it 'prefecture_idが0では登録できない' do
      @buying_item_shipping.prefecture_id = 0
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'municipalityが空では登録できない' do
      @buying_item_shipping.municipality = ''
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空では登録できない' do
      @buying_item_shipping.address = ''
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では登録できない' do
      @buying_item_shipping.phone_number = ''
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空では登録できない' do
      @buying_item_shipping.token = ''
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it 'address_numberは半角数字でなければならない' do
      @buying_item_shipping.address_number = '０００-００００'
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Address number is invalid")
    end
    it 'address_numberは3桁-4桁の形でなければならない' do
      @buying_item_shipping.address_number = 00-00000
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Address number is invalid")
    end
    it 'phone_numberは半角数字でなければならない' do
      @buying_item_shipping.phone_number = '０９０９０９０９０９０'
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは10桁以上でなければならない' do
      @buying_item_shipping.phone_number= '000'
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは11未満でなければならない' do
      @buying_item_shipping.phone_number = '09090909090909090'
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it 'userが紐づいてなければ出品できない' do
      @buying_item_shipping.user_id = nil
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいてなければ出品できない' do
      @buying_item_shipping.item_id = nil
      @buying_item_shipping.valid?
      expect(@buying_item_shipping.errors.full_messages).to include("Item can't be blank")
    end
  end
 end 
end
