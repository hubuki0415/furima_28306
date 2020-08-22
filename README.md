# テーブル設計

## Users テーブル

| Column               | Type   | Options     |
| --------             | ------ | ----------- |
| first_name           | string | null: false |
| last_name            | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| nickname             | string | null: false |
| birth_bay            | date   | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |

### Association

- has_many   :items
- has_many   :purchases

## Items テーブル

| Column                 | Type       | Options                         |
| --------               | ------     | -----------                     |
| name                   | string     | null: false                     |
| image                  | string     | null: false                     |
| price                  | integer    | null: false                     |
| user                   | references | null: false, foreign_key: true  |
| category_id            | integer    | null: false                     |
| status_id              | integer    | null: false                     |
| explanation            | text       | null: false                     |
| burden_id              | integer    | null: false                     |
| prefectures_id         | integer    | null: false                     |
| days_until_shipping_id | integer    |                                 |

### Association

- has_one    :purchase
- belongs_to :user

## Purchases テーブル

| Column               | Type       | Options                        |
| --------             | ------     | -----------                    |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association

- has_one    :street_address
- belongs_to :user
- belongs_to :item

## Street_addresses テーブル

| Column             | Type       | Options                        |
| --------           | ------     | -----------                    |
| postal_code        | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |
| prefectures_id     | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |

### Association

- belongs_to :purchase