
# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | -----------               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :buying_items


## items テーブル

| Column               | Type       | Options                        |
| ----------           | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_info            | text       | null: false                    |
| category_id          | integer    | null: false                    |
| item_sales_status_id | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| shipping_days_id     | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buying_item


## buying_items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buying_item


## shipping_address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address_number   | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| buying_item      | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_item