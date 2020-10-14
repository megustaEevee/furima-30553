require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報' do
    it '全ての商品情報が存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it '商品画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が空だと登録できない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it '商品のカテゴリーが空だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態が空だと登録できない' do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status must be other than 1')
    end
    it '配送料の負担情報が空だと登録できない' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
    end
    it '配送元の地域情報が空だと登録できない' do
      @item.prefecture_source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture source must be other than 1')
    end
    it '発送までの日数情報が空だと登録できない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
    end
    it '価格が空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格は300円未満だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格は9999999円より大きいと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格は半角数字でなければ登録できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
