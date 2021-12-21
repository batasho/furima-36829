require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録できる時' do
      it '全ての項目が入力されている' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できない時'do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品説明が空では登録できない'do
        @item.explaration = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explaration can't be blank"
      end
      it 'カテゴリーで「---」が選択されている場合は登録できない'do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態で「---」が選択されている場合は登録できない'do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担で「---」が選択されている場合は登録できない'do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it '発送元の地域で「---」が選択されている場合は登録できない'do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送までの日数で「---」が選択されている場合は登録できない'do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '価格が空では登録できない'do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が全角だと登録できない'do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price  is invalid. Input half-width characters"
      end
      it '価格が範囲外だと登録できない'do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '価格が範囲外だと登録できない'do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
