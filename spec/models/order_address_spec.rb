require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  context '購入ができるとき' do
    it 'すべてのフォームの入力がされている' do
      expect(@order_address).to be_valid
    end
    it '建物名が空でも保存できる' do
      @order_address.buliding_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空だと保存できないこと' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Token can't be blank"
    end
    it '郵便番号は空では保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
    end
    it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end
    it '都道府県に「---」が選択されている場合は購入できないこと' do
      @order_address.shipping_area_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it '市区町村が空だと購入できないこと' do
      @order_address.city_name = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City name can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_address.block_name = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block name can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがあると保存できないこと' do
      @order_address.phone_number = 123 - 1234 - 1234
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号が9桁以下だと保存できないこと' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include 'Phone number is invalid'
    end
    it '電話番号が12桁以上あると保存できないこと' do
      @order_address.phone_number = 12_345_678_910_123_111
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'user_idが空だと登録できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "User can't be blank"
    end
    it 'item_idが空だと登録できない」' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Item can't be blank"
    end
  end
end
