# テーブル設計

# usersテーブル

| Column             | type          | option
| ------------------ | ------------- | ----------- |
| nickname           | string        | null: false |
| email              | string        | null: false |
| encrypted_password | string        | null: false |
| lastname_kanji     | text          | null: false |
| firstname_kanji    | string        | null: false |
| lastname_katakana  | text          | null: false |
| firstname_katakana | string        | null: false |
| birthday           | date          | null: false |


### Association

- has_many :items
- belongs_to :purchase


# itemsテーブル

| Column             | Type          | Option                        |
| ------------------ | ------------- | ----------------------------- |
| description        | text          | null: false                   |
| category           | string        | null: false                   |
| condition_id       | string        | null: false                   |
| shipping_cost_id   | string        | null: false                   |
| shipping_origin_id | string        | null: false                   |
| shipping_days_id   | string        | null: false                   |
| price              | integer       | null: false                   |
| user               | references    | null:false, foreign_key :true |

### Association

- belongs_to :user
- has_one :purchase


# addressesテーブル

| Column            | Type   | Option      |
| ----------------- | -------| ----------- |
| postal_code       | string | null: false |
| prefecture        | string | null: false |
| city_town_village | text   | null: false |
| address           | text   | null: false |
| building          | text   | null: false |
| phone_number      | string | null: false |

### Association

- has_many :purchases


# purchasesテーブル

| Column  | Type       | Option                        |
|-------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key :true |
| item    | references | null:false, foreign_key :true |

### Association

- belongs_to :user
- has_one :item