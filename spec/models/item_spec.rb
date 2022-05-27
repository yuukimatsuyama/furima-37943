require 'rails_helper'

<<<<<<< Updated upstream
RSpec.describe Item,type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    describe '商品出品' do
      context '商品が出品できる' do
        it '各カラムが正常に入力されれば、商品が出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品が出品できない' do
        it 'item_nameが空では登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'contentが空では登録できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'category_idが0では登録できない' do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 0")
        end
        it 'product_status_idが0では登録できない' do
          @item.product_status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Product status must be other than 0")
        end
        it 'delivery_charge_idが0では登録できない' do
          @item.delivery_charge_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
        end
        it 'prefecture_idが0では登録できない' do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
        end
        it 'shipping_days_idが0では登録できない' do
          @item.shipping_days_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping days must be other than 0")
        end
        it 'priceは数字でなければならない' do
          @item.price = '千円'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceは半角数字でなければならない' do
          @item.price = '６００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is not a number")
        end
        it 'priceは300以上のでなければならない' do
          @item.price = 20
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'priceは9999999以下でなければならない' do
          @item.price = 100000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'userが紐づいてなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
=======
RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> Stashed changes
end
