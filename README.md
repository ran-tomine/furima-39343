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
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| situation_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| region_of_origin_id | integer    | null: false                    |
| day_to_ship_id      | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| region_of_origin_id | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order