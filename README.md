# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| katakana           | string | null: false |
| date_of_birth      | string | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column            | Type   | Options                        |
| ----------------- | ------ | ------------------------------ |
| name              | string | null: false                    |
| image             | text   | null: false                    |
| user_id           | string | null: false, foreign_key: true |
| text              | text   | null: false                    |
| category          | string | null: false                    |
| situation         | string | null: false                    |
| shipping_charges  | string | null: false                    |
| region_of_origin  | string | null: false                    |
| days_to_ship      | string | null: false                    |
| price             | string | null: false                    |

### Association

- belongs_to :user
- has_many :orders

## orders テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| card_information | string | null: false                    |
| date_of_expiry   | string | null: false                    |
| security_code    | string | null: false                    |
| user_id          | string | null: false, foreign_key: true |
| item_id          | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | references | null: false                    |
| municipalities   | references | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| order_id         | string     | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- belongs_to :order