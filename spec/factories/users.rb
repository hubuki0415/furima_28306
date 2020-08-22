FactoryBot.define do
  factory :user do
    nickname {"太朗"}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"太朗"}
    last_name {"山田"}
    first_name_kana {"タロウ"}
    last_name_kana {"ヤマダ"}
    birth_day{Faker::Date.between_except(from: '2014-09-23', to: '2015-09-25', excepted: '2015-01-24')}
  end
end
