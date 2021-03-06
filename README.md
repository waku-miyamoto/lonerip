# README

# 概要
  - 写真付きの記事の投稿ができます。また、他の人の投稿に、コメントできたり、いいねをつけたりなどできます。
  - 投稿者だけが記事の削除、編集ができます。
# 制作背景
  - 年々一人行動をする人が増えてきています。またコロナウイルスの影響もあり集団で行動しにくくなっている中、
  新たに一人行動をする際にどうすればいいのか、どう行った場所がおすすめなのか、など、新規ユーザーの  
  手助けになれるようなコミュニケーションアプリがあればいいと思い制作しました。

# DEMO
 トップページ  
  ![toppage](toppage.png)  
  ユーザーページ    
 ![post_page](post_page.png)  
  詳細ページ  
 ![user_page](user_page.png)

# 使用技術
  Ruby/Ruby on Rails/MYSQL//Github/AWS/Visual Studio Code
 ## gem
 - gem "haml-rails", ">= 1.0", '<= 2.0.1'
 - gem 'font-awesome-sass'
 - gem 'devise'
 - gem 'pry-rails'
 - gem 'carrierwave'
 - gem 'fog-aws'
 - gem 'mini_magick'
 - gem 'devise-i18n'
 - gem 'devise-i18n-views'
 - gem 'kaminari'
 - gem 'bootstrap', '~> 4.1.1'
 - gem 'ransack'
 - gem 'rails_12factor', group: :production
 - gem 'mini_racer'
# 課題や追加したい機能
 - 見た目がまだまだ不格好なので綺麗にしていきたいです。
 - ユーザーのプロフィールページを作りたいです。
# 工夫したポイント
  - 画面をスクロールするのが苦手なので全体はあまりスクロールしない作りにしました。
  また明るい色を極力抑え目に優しいよう心がけました。

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|


### Association
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :posts

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|image|string|null: false|
|user_id|references|null: false, foreign_key: true|


### Association
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :user

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :post
- belongs_to :user
