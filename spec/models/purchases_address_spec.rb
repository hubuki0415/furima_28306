require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      user1 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item,user_id: @user.id)
      @purchasesaddress = FactoryBot.build(:purchaseAddress,user_id: user1.id,item_id: @item.id)
    end
      describe '商品の購入ががうまくいくこと' do
        it "郵便番号・都道府県・市区町村・番地・電話番号、建物名、カード情報があればうまくいくこと、" do
        
          expect(@item).to be_valid
        end
      end
         describe '商品の購入ががうまくいかないこと' do
            it "郵便番号が必須であること" do
              @purchasesaddress.postal_code = nil
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Postal code can't be blank")
            end

            it "郵便番号には-が必須であること" do
              @purchasesaddress.postal_code = "1235678"
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Postal code は-を入力してください。")
            end

            it "都道府県が必須であること" do
                @purchasesaddress.prefectures_id = nil
                @purchasesaddress.valid?
                expect(@purchasesaddress.errors.full_messages).to include("Prefectures can't be blank")
            end

            it "市区町村が必須であること" do
              @purchasesaddress.municipalities = nil
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Municipalities can't be blank")
            end

            it "番地が必須であること" do
              @purchasesaddress.street_addresses = nil
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Street addresses can't be blank")
            end

            it "電話番号が必須であること" do
              @purchasesaddress.phone_number = nil
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Phone number can't be blank")
            end

            it "電話番号は-なしで11桁であること" do
              @purchasesaddress.phone_number = "12345"
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Phone number は11桁で入力してください。")
            end

            it "カード情報が必須であること" do
              @purchasesaddress.token = nil
              @purchasesaddress.valid?
              expect(@purchasesaddress.errors.full_messages).to include("Token can't be blank")
            end
         end
  end 
end