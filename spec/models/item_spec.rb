require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, category_id: 2, situation_id: 2, shipping_charge_id: 2, region_of_origin_id: 2, day_to_ship_id: 2)
    
  end

  describe '商品情報の保存' do
    context "商品情報が保存できる場合" do
      it "画像、商品名、商品の説明、カテゴリー情報、商品の状態、配送料の負担の情報、発送元の地域、発送日までの日数、価格情報があれば商品情報は保存される" do
        expect(@item).to be_valid
      end
      
    end
    context "商品情報が保存できない場合" do
      it "商品画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと商品情報は保存できない" do
        @item.name  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと商品情報は保存できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリー情報がないと商品情報は保存できない" do
        @item.category_id  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be selected")
      end
      it "商品の状態の情報がないと商品情報は保存できない" do
        @item.situation_id   = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "配送料の負担の情報がないと商品情報は保存できない" do
        @item.shipping_charge_id   = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "発送元の地域情報がないと商品情報は保存できない" do
        @item.region_of_origin_id  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region of origin can't be blank")
      end
      it "発送日までの日数の情報がないと商品情報は保存できない" do
        @item.day_to_ship_id    = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end     
      it "価格の情報がないと商品情報は保存できない" do
        @item.price    = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

    it "価格の情報が0以下だと商品情報は保存できない" do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 0")
    end

    it "価格の情報が数値でないと商品情報は保存できない" do
      @item.price = "invalid"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    end
  end
  
end
