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
- has_many :orders
## items
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| description| text       | null: false |
| category_id| integer    | null: false |
| condition_id| integer    | null: false |
| shipping_free_burden_id  | integer     | null: false |
| shipping_day_id| integer  |  null: false|
| prefecture_id| integer  | null: false |
| price      | integer    | null: false |
| user       | references | null: false,foreign_key: true |
### Association
- belongs_to :user
- has_one :order
## shipping_addresses
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| post_code  | string    | null: false |
| region     | string     | null: false |
| city       | string     | null: false |
| street_address | string | null: false |
| building   | string     |
| phone      | string    | null: false |
| order      | references | null: false,foreign_key: true |
### Association
- belongs_to:order
## orders
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
### Association
- has_one :shipping_address
- belongs_to :user
- belongs_to :item
