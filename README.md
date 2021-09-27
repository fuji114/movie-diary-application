# MovieDiary
  
## 概要
  
このアプリはどんな映画を見たのかを記録するメモ用のアプリであり、また別アカウントから閲覧やコメント出来る機能を持っています。
  
## 本番環境
  
URL:https://movie-diary-application.herokuapp.com/  
Basic認証  
ID:admin  
PASSWORD:2222  
  
ログイン情報（テスト用）  
Eメール:aaa@mails  
パスワード:222222  
  

## 制作背景(意図)
  
　使用目的は映画を視聴して、いつ・どんな映画を見たのかを記録するメモとしてのアプリを目指して作成しました。  
記入する情報は最低限にして簡単に記録できてタイトルからの検索もできるようにしてあります。  

  
## DEMO
  
  ### トップページ
[![Image from Gyazo](https://i.gyazo.com/bc23349c5356e60ffadff99696ea7aa1.png)](https://gyazo.com/bc23349c5356e60ffadff99696ea7aa1)  
  
  ### 新規投稿ページ
[![Image from Gyazo](https://i.gyazo.com/d6b5738ad933a78c389e138f872d5534.png)](https://gyazo.com/d6b5738ad933a78c389e138f872d5534)  
  
  ### 投稿詳細ページ
[![Image from Gyazo](https://i.gyazo.com/d0bdf020577ccaa377b949a131bb4ba0.png)](https://gyazo.com/d0bdf020577ccaa377b949a131bb4ba0)  
  
## 工夫したポイント
  
- 評価用の星をつける機能
  
## DB設計
  

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


## casts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| actor              | string     |                                |
| movie              | references | null: false, foreign_key: true |

### Association

- belongs_to :movie

