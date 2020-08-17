# テーブル設計

## User テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| nickname  | string | null: false |
| birthbay  | date   | null: false |
| name_kana | string | null: false |

### Association

- has_many   :Items
- has_many   :Purchases

## Item テーブル

| Column   | Type   | Options                  |
| -------- | ------ | -----------              |
| name     | string | null: false              |
| image    | string | null: false              |
| price    | string | null: false              |
| user_id  | string | null: false, references  |
| category | string | null: false              |
| status   | string | null: false              |

### Association

- has_many   :Purchases
- belongs_to :User

## Purchase テーブル

| Column               | Type   | Options                 |
| --------             | ------ | -----------             |
| user_id              | string | null: false, references |
| item_id              | string | null: false, references |
| street_address_id    | string | null: false, references |

### Association

- has_many   :Street addresss
- belongs_to :User
- belongs_to :Item

## Street address テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| postal_code     | string | null: false |
| prefectures     | string | null: false |
| phone_number    | string | null: false |

### Association

- belongs_to :Purchase