# MovieDiary
  
## 概要
  
このアプリはどんな映画を見たのかを記録するメモ用のアプリであり、また別アカウントから閲覧やコメント出来る機能を持っています。
  
## 本番環境
  
URL:https://movie-diary-application.herokuapp.com/
ID:
PASSWORD:
  
## 制作背景
  
[![Image from Gyazo](https://i.gyazo.com/385ca2d20758739026ea3f1765e78d83.png)](https://gyazo.com/385ca2d20758739026ea3f1765e78d83)
## DEMO
  
  [![Image from Gyazo](https://i.gyazo.com/b509bbe62834eb74f8fb932423568b1e.gif)](https://gyazo.com/b509bbe62834eb74f8fb932423568b1e)
￼./images/MovieDiary2222.png
## 工夫したポイント
  
・評価用の星をつける機能
  
## 実装予定の内容
  
・タグ機能
・出演者を多数記述できるように多対多のアソシエーション
・カレンダー機能
  
## DB設計
  
  
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

