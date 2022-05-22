
# テーブル設計

## users テーブル

| Column             | Type    | Options              |
| ------------------ | ------  | -----------          |
| nickname           | string  | null: false          |
| email              | string  | null: false, key:uni |
| encrypted_password | string  | null: false          |
| name               | string  | null: false          |
| name(kana)         | string  | null: false          |
| birthday           | integer | null: false          |


## items テーブル

| Column              | Type       | Options                        |
| ----------          | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| content             | text       | null: false                    |
| category            | string     | null: false                    |
| image               | string     | null: false                    |
| product_status      | string     | null: false                    |
| derivary_charge     | integer    | null: false                    |
| area                | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## buying_items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

## shipping_address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address_number   | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: true                     |
| phone_number     | integer    | null: false                    |
| buying_item      | references | null: false, foreign_key: true |
