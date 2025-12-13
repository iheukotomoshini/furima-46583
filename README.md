# README

## users テーブル
| Column             | Type   |Options|
| ------             | ----   |-------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| last_name          | string | null: false |
| family_name_kana   | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | data   | null: false |

### Association
has_many :items
has_many :orders
has_many :purchase_users


## items テーブル
| Column                 | Type       |Options|
| ------                 | ----       |-------|
| title                  | string     | null: false |
| explanation            | text       | null: false |
| category_id            | integer    | null :false |
| status_id              | integer    | null :false |
| shipping_fee_status_id | integer    | null :false |
| prefecture_id          | integer    | null :false |
| scheduled_delivery_id  | integer    | null :false |
| price                  | integer    | null :false |  
| user                   | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :order 
belongs_to :purchase_user


## orders テーブル
| Column              | Type       |Options|
| ------              | ----       |-------|
| postal-code         | string     | null :false | 
| prefecture_id       | integer    | null :false | 
| city                | string     | null :false | 
| addresses           | string     | null :false | 
| building            | string     |             | 
| phone_number        | string     | null :false | 
### Association
has_many :items
belongs_to :user

## purchase_usersテーブル
| Column                 | Type       |Options|
| ------                 | ----       |-------|
| item                   | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |
### Association
belongs_to :item
belongs_to :user




