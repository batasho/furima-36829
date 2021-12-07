## users　テーブル（ユーザー情報）
| Colum              | Type       | Options                        |
|--------------------|------------|--------------------------------|
| nickname           | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| Kfirst_name        | string     | null: false                    |
| Klast_name         | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
has_many :stocks

## stocks テーブル（出品情報）
| Colum              | Type       | Option                         |
|------------------- |------------|------------------------------  |
| name               | text       | null: false                    |
| explaration        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| charge_id          | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price_id           | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| buyer              | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :buyer
belongs_to :purchase

## buyers テーブル （購入者情報）
| Colum              | Type       | Option                         |
|------------------  |------------|--------------------------------|
| postal             | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipality       | integer    | null: false                    |
| address            | integer    | null: false                    |
| building           | integer    | null: false                    |
| phone              | integer    | null: false                    |

### Association
has_many :stocks
has_one :purchase

## purchase テーブル　（購入者の記録）
| Colum              |Type        | Option                         |
|--------------------|------------|--------------------------------|
| buyer              | references | null: false, foreign_key: true |
| stocks             | references | null: false, foreign_key: true |

### Association
has_one :stock
has_one :buyer
