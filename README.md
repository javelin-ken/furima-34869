# テーブル設計

# usersテーブル

| Column             | type          | option
| ------------------ | ------------- | ------------------------- |
| nickname           | string        | null: false               |
| email              | string        | null: false, unique :true |
| encrypted_password | string        | null: false               |
| lastname_kanji     | string        | null: false               |
| firstname_kanji    | string        | null: false               |
| lastname_katakana  | string        | null: false               |
| firstname_katakana | string        | null: false               |
| birthday           | date          | null: false               |


### Association

- has_many :items
- has_many :purchases


# itemsテーブル

| Column             | Type          | Option                        |
| ------------------ | ------------- | ----------------------------- |
| name               | string        | null: false                   |
| description        | text          | null: false                   |
| category_id        | integer       | null: false                   |
| condition_id       | integer       | null: false                   |
| shipping_cost_id   | integer       | null: false                   |
| shipping_origin_id | integer       | null: false                   |
| shipping_days_id   | integer       | null: false                   |
| price              | integer       | null: false                   |
| user               | references    | null:false, foreign_key :true |

### Association

- belongs_to :user
- has_one :purchase


# addressesテーブル

| Column            | Type    | Option                            |
| ----------------- | ------- | --------------------------------- |
| postal_code       | string  | null: false                       |
| sipping_origin_id | integer | null: false                       |
| city_town_village | string  | null: false                       |
| address           | string  | null: false                       |
| building          | string  |                                   |
| phone_number      | string  | null: false                       |
| purchase          | references | null: false, foreign_key :true |

### Association

- belongs_to :purchase


# purchasesテーブル

| Column  | Type       | Option                        |
|-------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key :true |
| item    | references | null:false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address