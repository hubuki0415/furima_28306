FactoryBot.define do
  factory :purchaseAddress do
    postal_code {"123-4567"}
    phone_number {"0901234567"}
    municipalities {"横浜市緑区"}
    street_addresses {"青山1-1-1"}
    building_name {"楔ビル103"}
    prefectures_id {21}
    token {"token"}

    association :user
    association :item
  end
end