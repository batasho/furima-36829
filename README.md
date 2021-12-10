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
has_many :purchases

## stocks テーブル（出品情報）
| Colum              | Type       | Option                         |
|------------------- |------------|------------------------------  |
| name               | string     | null: false                    |
| explaration        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| charge_id          | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| buyer              | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :purchase
has_one :purchase


## buyers テーブル （購入者情報）
| Colum              | Type       | Option                         |
|------------------  |------------|--------------------------------|
| postal             | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association
belongs_to :purchase


## purchases テーブル　（購入履歴）
| Colum              |Type        | Option                         |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_ley: true |
| stock              | references | null: false, foreign_key: true |

### Association
belongs_to :stock
has_one :buyer
belongs_to :user

