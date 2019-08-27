## README
# Scent Note
### 概要
---
- 香水について自分のために記録を残しておけます。
- 他のユーザーが投稿した記録を参考にすることもできます。
- 投稿された記録にコメントを送れ、質問することもできます。
### コンセプト
---
- 店舗で試してみただけでは気に入るかわからないため、その場で購入に踏み切ることの難しい香水の購入を補助します。
- 香りと言葉を擦り合わせていくことを目指します。
### バージョン
---
Ruby 2.6.3
Ruby on Rails 5.2.3
Postgresql 11.2
### 機能
---
- ユーザー登録、編集、削除(退会)機能
  - ログイン、ログアウト機能
  - フォロー、解除機能
  - 香水お気に入り、解除機能
  - ブランドお気に入り、解除機能
- 香水記録投稿、削除、編集機能
  - 記録お気に入り、解除機能
  - コメント投稿、削除、編集機能
  - 記録一覧表示機能
- 香水検索機能
  - ページネーション
  - 香水一覧表示機能
  - ブランド一覧表示機能

### カタログ設計、テーブル定義
---
(https://docs.google.com/spreadsheets/d/1fvvd2hUMWQ2sHrdhj15Y_yvZwSpFARmr0UW1aSyboGw/edit?usp=sharing)
### ER図
---
(https://docs.google.com/spreadsheets/d/1fvvd2hUMWQ2sHrdhj15Y_yvZwSpFARmr0UW1aSyboGw/edit#gid=402658823)

### 画面遷移図
---
(https://docs.google.com/spreadsheets/d/1fvvd2hUMWQ2sHrdhj15Y_yvZwSpFARmr0UW1aSyboGw/edit#gid=1961325601)
### 画面ワイヤーフレーム
---
(https://docs.google.com/spreadsheets/d/1fvvd2hUMWQ2sHrdhj15Y_yvZwSpFARmr0UW1aSyboGw/edit#gid=1167721662)
### 使用予定Gem
---
- device
- ransnack
- kaminari
- mini_magick
- carrierwave
- country-select
- RailsAdmin
