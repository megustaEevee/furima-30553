require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  before do
    @purchaser_address = FactoryBot.build(:purchaser_address)
  end

  describe '購入者情報の保存' do
    it '購入者情報が全て存在すると保存できる' do
      expect(@purchaser_address).to be_valid
    end
    it '建物名は空でも保存できる' do
      @purchaser_address.building = nil
      expect(@purchaser_address).to be_valid
    end
    it '電話番号は11桁以内だと保存できる' do
      @purchaser_address.phone_number = '1234567890'
      expect(@purchaser_address).to be_valid
    end

    it '郵便番号が空だと保存できない' do
      @purchaser_address.post_code = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号はハイフンがないと保存できない' do
      @purchaser_address.post_code = '1234567'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Post code is invalid')
    end
    it '郵便番号はハイフンの前に半角数字が３でないと保存できない' do
      @purchaser_address.post_code = '12-34567'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Post code is invalid')
    end
    it '郵便番号はハイフンの後ろに半角数字が4でないと保存できない' do
      @purchaser_address.post_code = '123-45678'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Post code is invalid')
    end
    it '都道府県が空だと保存できない' do
      @purchaser_address.prefecture_id = 1
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が空だと保存できない' do
      @purchaser_address.city = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できない' do
      @purchaser_address.addresses = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Addresses can't be blank")
    end
    it '電話番号が空だと保存できない' do
      @purchaser_address.phone_number = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号はハイフンが含まれる保存できない' do
      @purchaser_address.phone_number = '090-1234567'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
    end
    it '電話番号は11桁より多いと保存できない' do
      @purchaser_address.phone_number = '123456789000'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'クレジットカード情報が空だと保存できない' do
      @purchaser_address.token = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
