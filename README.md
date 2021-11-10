# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

* has_many :items
* has_many :buys

## items テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| explanation | string     | null: false       |
| image       | string     | null: false       |
| user        | references | foreign_key: true |


### Association

* belongs_to :user
* has_one :buys

## buys テーブル

|Column|Type|Options|
| -------|----|-------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |


### Association

* belongs_to :user
* belongs_to :item
* has_one :shipping address

## shipping address テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| ZIP/Postal code | string     | null: false       |
| country         | string     | null: false       |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building name   | string     |                   |
| pone number     | string     | null: false       |
| buy             | references | foreign_key: true |


### Association

* belongs_to :buy