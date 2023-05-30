require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができない場合' do
      it "post_codeが空では保存できない" do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end

      it "post_codeがハイフンを含まない形式では保存できない" do
        @order_form.post_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "region_of_origin_idが1では保存できない" do
        @order_form.region_of_origin_id = '---'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Region of origin can't be blank")
      end

      it "municipalityが空では保存できない" do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空では保存できない" do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it "telephone_numberが空では保存できない" do
        @order_form.telephone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end

      it "telephone_numberが半角数字以外を含む場合は保存できない" do
        @order_form.telephone_number = "090-1234-5678"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid")
      end


      it "telephone_numberが10桁未満の場合は保存できない" do
        @order_form.telephone_number = "123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid")
      end


      it "telephone_numberが11桁を超える場合は保存できない" do
        @order_form.telephone_number = "123456789012"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
end
end
