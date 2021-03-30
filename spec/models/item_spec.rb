require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
  

    it 'imageとname、description、category、condition、shipping_cost、shipping_origin、shipping_days、priceがあれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryのidが1では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it 'conditionのidが1では保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Select")
    end

    it 'shipping_costのidが1では保存できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost Select")
    end

    it 'shipping_originのidが1では保存できない' do
      @item.shipping_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin Select")
    end

    it 'shipping_daysのidが1では保存できない' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days Select")
    end

    it 'priceが空では保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが英字では登録できない' do
      @item.price = 'one thousand'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end



    it 'priceが大文字の数字では登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it 'priceは299円以下は保存できないこと' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceは10,000,000以上は保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
