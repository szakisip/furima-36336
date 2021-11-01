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
| birthday           | data   | null: false              |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| product_name        | string     | null: false                  |
| description         | text       | null: false                  |
| category            | string     | null: false                  |
| condition           | string     | null: false                  |
| shipping_charges    | string     | null: false                  |
| shipping_area       | string     | null: false                  |
| shipping_days       | string     | null: false                  |
| price               | integer    | null: false                  |
| user                | references | null: false,foreign_key:true |

### Association

- belongs_to :user
- has_many :comments
- has_one:buyer

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| state       | string     | null: false                    |
| city        | string     | null: false                    |
| address1    | string     | null: false                    |
| address2    | string     |                                |
| telnumber   | string     | null: false                    |

### Association

- belongs_to :item

