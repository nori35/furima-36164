# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| name               | string | null: false |
| birthday           | string | null: false |
| encrypted_password | string | null: false |

### Association

* has_many :items
* has_many :buys

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| title              | string     | null: false       |
| explanation        | string     | null: false       |
| image              | string     | null: false       |
| product_details    | string     | null: false       |
| regarding_delivery | string     | null: false       |
| price              | string     | null: false       |
| user               | references | foreign_key: true |


### Association

* belongs_to :user
* has_one :buy

## buys テーブル

|Column|Type|Options|
| -------|----|-------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |


### Association

* belongs_to :user
* belongs_to :item
* has_one :shipping address

## shipping addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| Postal_code | string     | null: false       |
| country         | string     | null: false       |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |
| pone_number     | string     | null: false       |
| buy             | references | foreign_key: true |


### Association

* belongs_to :buy