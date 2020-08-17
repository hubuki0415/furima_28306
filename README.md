# テーブル設計

## User テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthbay | string | null: false |

### Association

- has_many   :Item
- has_many   :Exhibition
- has_many   :Purchase
- belongs_to :Street address

## Item テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| image    | string | null: false |
| price    | string | null: false |
| user_id  | string | null: false |
| category | string | null: false |

### Association

- has_many   :Purchase
- has_many   :Street address
- belongs_to :User
- belongs_to :Exhibition

##  Exhibition テーブル

| Column         | Type       | Options     |
| --------       | ------     | ----------- |
| name           | references | null: false |
| image          | references | null: false |
| price          | references | null: false |
| thedetails     | string     | null: false |
| explanation    | string     | null: false |

### Association

- has_many   :Purchase
- has_many   :Street address
- belongs_to :User
- belongs_to :Item

## Purchase テーブル

| Column            | Type   | Options     |
| --------          | ------   ----------- |
| name              | string | null: false |
| user_id           | string | null: false |
| price             | string | null: false |
| date and time     | string | null: false |
| street address    | string | null: false |

### Association

- has_many   :Street address
- belongs_to :Exhibition
- belongs_to :User
- belongs_to :Item

## Street address テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| name            | string | null: false |
| prefectures     | string | null: false |
| phone number    | string | null: false |

- belongs_to :user
- belongs_to :Item
- belongs_to :Exhibition
- belongs_to :Purchase