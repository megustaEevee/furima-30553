# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | text       | null: false |
| info                | text       | null: false | 
| category            | integer    | null: false |
| sales_status        | integer    | null: false |
| shipping_fee_status | integer    | null: false |
| prefecture_source   | integer    | null: false |
| scheduled_delivery  | integer    | null: false |
| price               | integer    | null: false |
| user                | references |             |

### Association

- belongs_to :users
- belongs_to :orders

## orders テーブル

| Column       | Type          | Options     |
| ------------ | ------------- | ----------- |
| post_code    | string        | null: false |
| prefecture   | integer       | null: false |
| city         | string        | null: false |
| addresses    | string        | null: false |
| building     | string        |             |
| phone_number | integer       | null: false |
| user         | references    |             |
| item         | references    |             |

### Association

- belongs_to :users
- has_one    :items