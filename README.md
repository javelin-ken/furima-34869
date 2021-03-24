# テーブル設計

# usersテーブル

| Column             | type          | option
| ------------------ | ------------- | ----------- |
| nickname           | string        |             |
| email              | string        | null: false |
| lastname_kanji     | text          | null: false |
| firstname_kanji    | string        | null: false |
| lastname_katakana  | text          | null: false |
| firstname_katakana | string        | null: false |
| birth_year         | integer       | null: false |
| birth_month        | integer       | null: false |
| birth_day          | integer       | null: false |


### Association

- has_many :items
- belongs_to :purchase


# itemsテーブル

| Column          | Type          | Option      |
| --------------- | ------------- | ----------- |
| image           | ActiveStorage |             |
| description     | text          | null: false |
| category        | string        | null: false |
| condition       | text          | null: false |
| shipping_cost   | string        | null: false |
| shipping_origin | string        | null: false |
| shipping_days   | string        | null: false |
| price           | integer       | null: false |
| user_id         | references    |             |

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

| Column  | Type       | Option |
|---------| ---------- |        |
| user_id | references |        |
| item_id | references |        |

### Association

- belongs_to :user
- has_one :item