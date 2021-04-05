require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '内容に問題がない場合' do
      it 'postal_code,shipping_origin_id,city_town_village,address,phone_number,tokenがあれば保存できること' do
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'shipping_origin_idが1では保存できないこと' do
        @purchase_address.shipping_origin_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping origin Select")
      end

      it 'city_town_villageが空では保存できないこと' do
        @purchase_address.city_town_village = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City town village can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end

      it 'phone_numberが空では保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字では保存できないこと' do
        @purchase_address.phone_number = '０９０００００００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
        @purchase_address.phone_number = '090000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_address.phone_number = '090000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが英字だと保存できないこと' do
        @purchase_address.phone_number = 'aaaaaaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
