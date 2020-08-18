# テーブル設計

## Users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| first_name    | string | null: false |
| family_name   | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| nickname      | string | null: false |
| birthbay      | date   | null: false |
| name_kana     | string | null: false |

### Association

- has_many   :Items
- has_many   :Purchases

## Items テーブル

| Column      | Type       | Options                         |
| --------    | ------     | -----------                     |
| name        | string     | null: false                     |
| image       | string     | null: false                     |
| price       | string     | null: false                     |
| user_id     | references | null: false, foreign_key: true  |
| category    | string     | null: false                     |
| status      | string     | null: false                     |
| explanation | string     | null: false                     |
| burden      | string     | null: false                     |

### Association

- has_one   :Purchases
- belongs_to :User

## Purchase テーブル

| Column               | Type       | Options                        |
| --------             | ------     | -----------                    |
| user_id              | references | null: false, foreign_key: true |
| item_id              | references | null: false, foreign_key: true |
| burden               | string     | null: false                    |
| prefectures          | string     | null: false                    |
| standard             | string     | null: false                    |

### Association

- has_one   :Street address
- belongs_to :User
- belongs_to :Item

## Street address テーブル

| Column          | Type       | Options                        |
| --------        | ------     | -----------                    |
| postal_code     | string     | null: false                    |
| phone_number    | string     | null: false                    |
| Purchase_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :Purchase