require 'rails_helper'

RSpec.describe BuyerPurchase, type: :model do
  describe '商品購入機能' do
    before do
      @buyer_purchase = FactoryBot.build(:buyer_purchase)
    end

    context'商品を購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_purchase).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buyer_purchase.building = ''
        expect(@buyer_purchase).to be_valid
      end
    end

    context'商品を購入できないとき'do
      it'postalが空のとき'do
        @buyer_purchase.postal = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Postal can't be blank")
      end
      it'postalに半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_purchase.postal = '1234567'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it'area_idを選択していないと保存できない' do
        @buyer_purchase.area_id = 0
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Area can't be blank")
      end
      it'municipalityが空だと保存できない' do
        @buyer_purchase.municipality = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it'addressが空だと保存できない' do
        @buyer_purchase.address = ''
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it'phoneが空だと保存できない' do
        @buyer_purchase.phone = nil
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it'phoneが正しい形式でないと保存できないこと'do
        @buyer_purchase.phone = '０８０ー９９９ー９９９９'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Phone input only number")
      end
      it'phoneが9桁以下では保存ができないこと'do
        @buyer_purchase.phone = '080456789'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Phone input only number")
      end
      it'phoneが12桁以上では保存ができないこと'do
        @buyer_purchase.phone = '080456789012'
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Phone input only number")
      end
      it'tokenが空では保存できない' do
        @buyer_purchase.token = nil
        @buyer_purchase.valid?
        expect(@buyer_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it'userが紐づいていないと保存できないこと' do
        @buyer_purchase.user_id = nil
        @buyer_purchase.valid?
      end
      it'itemが紐づいていないと保存できないこと' do
        @buyer_purchase.item_id = nil
        @buyer_purchase.valid?
      end
    end
  end
end