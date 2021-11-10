# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false, foreign_key: true |
| email              | string | null: false, foreign_key: true |
| encrypted_password | string | null: false, foreign_key: true |


### Association

* has_many :prototypes
* has_many :comments

## items テーブル

| Column      |Type|Options|
| ----------- |----|-------|
| title       |
| explanation |
| image       |


### Association

* has_many :prototypes
* has_many :comments

## buys テーブル

|Column|Type|Options|
|------|----|-------|


### Association

* has_many :prototypes
* has_many :comments

## shipping address テーブル

|Column|Type|Options|
|------|----|-------|


### Association

* has_many :prototypes
* has_many :comments