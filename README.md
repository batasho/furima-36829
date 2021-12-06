# users　テーブル
| Colum              | Type       | Options                        |
|--------------------|------------|--------------------------------|
| nickname           | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| first_name         | text       | null: false                    |
| last_name          | text       | null: false                    |
| birthday           | text       | null: false                    |

# stocks テーブル
| Colum              | Type       | Option                         |
|------------------- |------------|------------------------------  |
| image              | text       | null: false                    |
| name               | text       | null: false                    |
| explaration        | text       | null: false                    |
| category           | integer    | null: false                    |
| status             | integer    | null: false                    |
| charge             | integer    | null: false                    |
| area               | integer    | null: false                    |
| days               | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| buyer              | references | null: false, foreign_key: true |

# buyers テーブル
| Colum              | Type       | Option                         |
|------------------  |------------|--------------------------------|
| account            | integer    | null: false                    |
| expiry             | integer    | null: false                    |
| security           | integer    | null: false                    |
| postal             | text       | null: false                    |
| prefectures        | integer    | null: false                    |
| municipality       | text       | null: false                    |
| address            | text       | null: false                    |
| building           | text       | null: false                    |
| phone              | integer    | null: false                    |