# README

## users テーブル

| Column             | Type       | Options                 |
| -------------------| ---------- | ------------------------|
| nickname           | string     | null: false             |
| email              | string     | unique: true null: false|
| encrypted_password | string     | null: false             |
| last_name          | string     | null: false             |
| first_name         | string     | null: false             |
| last_name_kana     | string     | null: false             | 
| first_name_kana    | string     | null: false             |
| birthday           | date       | null: false             |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type        | Options                         |
| -------------------| ------------| --------------------------------|
| title              | string      | null: false                     |
| description        | text        | null: false                     |
| category_id        | integer     | null: false                     |
| status_id          | integer     | null: false                     |
| shipping_charge_id | integer     | null: false                     |
| shipping_area_id   | integer     | null: false                     | 
| shipping_day_id    | integer     | null: false                     |
| price              | integer     | null: false                     |
| user               | references  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column             | Type        | Options                         |
| user               | references |foreign_key: true |
| item               | references |foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル
| Column             | Type       | Options                           |
| -------------------| ---------- | ----------------------------------|
| order              | references | null: false, foreign_key: true    |
| postal_code        | string     | null: false                       |
| shipping_area_id   | integer    | null: false                       |
| city_name          | string     | null: false                       |
| block_name         | string     | null: false                       |
| buliding_name      | string     |                                   |
| phone_number       | string     | null: false                       |

### Association

- belongs_to :order




<!-- カラムの型	説明	用途
integer	数値	金額、回数など
string	文字(短文)	ユーザー名、メールアドレスなど
text	文字(長文)	投稿文、説明文など
boolean	真か偽か	はい・いいえの選択、合格・不合格のフラグなど
datetime	日付と時刻	作成日時、更新日時など -->

<!-- Optionsについては、必要であれば以下を参考にしましょう。

オプション	役割
null: false	カラムが空の状態では保存できない
unique: true	一意性のみ許可（同じ値は保存できない）
foreign_key: true	外部キーを設定（別テーブルのカラムを参照する） -->
