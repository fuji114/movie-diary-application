# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| email              | string  | null: false, unique: true      |
| encrypted_password | string  | null: false                    |
| nickname           | string  | null: false                    |

### Association

- has_many :movies
- has_many :comments


## movies テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| movie_title          | string     | null: false                    |
| movie_age            | integer    |                                |
| film_director        | string     |                                |
| genre                | integer    | null: false                    |
| synopsis             | text       |                                |
| movie_rating         | integer    | null: false                    |
| review               | text       |                                |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :cast
- has_one :tag


## comments テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| comment_title        | string     | null: false                    |
| comment_text         | text       | null: false                    |
| user                 | references | null: false, foreign_key: true |
| movie                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :movie


## tags テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| tag_name           | string     |                                |
| movie              | references | null: false, foreign_key: true |

### Association

- belongs_to :movie


## casts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| actor              | string     |                                |
| movie              | references | null: false, foreign_key: true |

### Association

- belongs_to :movie

