FactoryBot.define do
  factory :item do
    name {"アイテム名"}
    price {300}
    category_id {3}
    status_id  {5}
    explanation {"商品の説明"}
    burden_id   {1}
    prefectures_id   {21}
    days_until_shipping_id   {2}
    association :user
    

  end
end


