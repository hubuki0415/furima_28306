class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:phone_number,:municipalities,:street_addresses,:building_name,:purchase_id,:prefectures_id,:token
  haihunn = /\A\d{3}[-]\d{4}\z/
  haihunnasi = /\A\d{11}\z/


    with_options presence: true do
      validates :token
      validates :postal_code
      validates :phone_number
      validates :municipalities
      validates :street_addresses 
      validates :prefectures_id
    end

  validates :postal_code, format: {with: haihunn, message: "は-を入力してください。"}
  
  validates :phone_number, format: {with: haihunnasi, message: "は11桁で入力してください。"}


  def save

   purchase = Purchase.create(user_id:user_id,item_id:item_id)
   Address.create(postal_code: postal_code,phone_number: phone_number,municipalities: municipalities,street_addresses: street_addresses,building_name: building_name,purchase_id: purchase.id,prefectures_id: prefectures_id)
  end
end