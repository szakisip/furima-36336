# README


# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_rename        | string | null: false              |
| first_rename       | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| product_name        | string     | null: false                  |
| description         | text       | null: false                  |
| category_id         | integer    | null: false                  |
| condition_id        | integer    | null: false                  |
| shipping_charge_id  | integer    | null: false                  |
| state_id            | integer    | null: false                  |
| shipping_day_id     | integer    | null: false                  |
| price               | integer    | null: false                  |
| user                | references | null: false,foreign_key:true |

### Association

- belongs_to :user
- has_one:order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| state_id    | integer    | null: false                    |
| city        | string     | null: false                    |
| address1    | string     | null: false                    |
| address2    | string     |                                |
| telnumber   | string     | null: false                    |
| order       | references | null: false,foreign_key:true   |

### Association

- belongs_to :order

