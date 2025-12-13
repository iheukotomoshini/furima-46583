# README

## users テーブル
| Column           | Type   |Options|
| ------           | ----   |-------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | string | null: false |

## items テーブル
| Column              | Type   |Options|
| ------              | ----   |-------|
| title               | string | null: false |
| explanation         | text   | null: false |
| category            | string | null :false |
| status              | string | null :false |
| shipping_fee_status | string | null :false |
| delivery_prefecture | string | null :false |
| scheduled_delivery  | string | null :false |
| price               | string | null :false |  
| user                | references | null: false, foreign_key: true |

## orders テーブル
| postal-code         | string | null :false | 
| prefecture          | string | null :false | 
| city                | string | null :false | 
| addresses           | string | null :false | 
| building            | string |             | 
| phone_number        | string | null :false | 
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

## comments テーブル
| Column              | Type   |Options|
| ------              | ----   |-------|
| content             | text   | null: false |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


