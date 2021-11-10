# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |
| encrypted_password | string | null: false |

### Association

* has_many :items
* has_many :buys

## items テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| title                 | string     | null: false       |
| explanation           | text       | null: false       |
| image                 | string     | null: false       |
| category_id           | integer    | null: false       |
| product_condition_id  | integer    | null: false       |
| shipping_charges_id   | integer    | null: false       |
| shipping_area_id      | integer    | null: false       |
| bays_to_ship_id       | integer    | null: false       |
| price                 | numeric    | null: false       |
| user                  | references | foreign_key: true |

### Association

* belongs_to :user
* has_one :buy

## buys テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :shipping_address

## shipping_addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| Postal_code     | string     | null: false       |
| country         | string     | null: false       |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |
| pone_number     | string     | null: false       |
| buy             | references | foreign_key: true |

### Association

* belongs_to :buy