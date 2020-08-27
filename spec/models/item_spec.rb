require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload("public/images/text_images.png")
  end
 

 describe '商品の出品ががうまくいくこと' do
    it "商品名、価格の情、商品の説明、カテゴリーの情報、商品の状態、配送料の負担、配送元の地域、配送までの日数があれば出品できる" do
    
      expect(@item).to be_valid
    end

    describe '商品の出品ががうまくいかない場合' do

      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が必須であること' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it '配送料の地域についての情報が必須であること' do
      @item.prefectures_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end

      it '配送料の日数についての情報が必須であること' do
        @item.days_until_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end

      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9999999の間であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
 end
end
