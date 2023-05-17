# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| first_katakana     | string | null: false             |
| last_katakana      | string | null: false             |
| date_of_birth      | date   | null: false             |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| text                | text       | null: false                    |
| category_id         |  integer   | null: false                    |
| situation_id        | integer    | null: false                    |
| shipping_charges_id | integer    |  null: false                   |
| region_of_origin_id | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :orders

## orders テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
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