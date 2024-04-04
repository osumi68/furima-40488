# README

## users
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|nickname            | string  | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |
### Association
- has_many :items
- belongs_to :shipping_address
## items
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| description| text       | null: false |
| image      | text       | null: false |
| category   | string     | null: false |
| condition  | integer    | null: false |
| shipping_free_burden    | boolean     | null: false |
| shipping_days| integer  |  null: false|
| prefecture_id| integer  | null: false |
| price      | integer    | null: false |
| user_id    | references | null: false,foreign_key: true |
### Association
- belongs_to :user
- belongs_to :shipping_address
## shipping_address
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| post_code  | integer    | null: false |
| state      | string     | null: false |
| city       | string     | null: false |
| street_address | integer| null: false |
| building   | string     | null: false |
| phone      | integer    | null: false |
| order_id   | references | null: false,foreign_key: true |
### Association
- has_one :order
## orders
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false, foreign_key: true |
| item       | string     | null: false |
### Association
- belongs_to :shipping_address
- belongs_to :user
