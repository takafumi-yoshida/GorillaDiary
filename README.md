# アプリ名

- GorillaDiary

# 実装機能

- 新規登録、ログイン機能（devise）
- ログアウト機能
- 日記作成機能＜タイトル、内容＞
- 日記削除機能
- お気に入り機能＜日記に対して＞
- フォロー機能＜ユーザーに対して＞
- 閲覧履歴機能＜日記に対して＞
- コメント機能


# テーブルの種類

## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false,unique:true|
|email|string|null:false,unique:true|
|encrypted_password|string|null:false|
### Association
- has_many :diaries, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_diaries, through: :likes, source: :diary
- has_many :browsing_histories, dependent: :destroy
- has_many :history_diaries, through: :browsing_histories, source: :diary
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow


## diaries table
|Column|Type|Options|
|------|----|-------|
|title|string|null:false|
|content|text||null:false|
|user_id|integer|null: false, foreign_key: true|
|status|integer|null: false|
### Association
- belongs_to :user
- belongs_to :datetime
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_diaries, through: :likes, source: :user
- has_many :browsing_histories, dependent: :destroy
- has_many :history_diaries, through: :browsing_histories, source: :user

## comments table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|content|string|null:false|
### Association
- belongs_to :user
- belongs_to :item

## likes table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## browsing_histories
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## Relationship
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|follow|integer|foreign_key: { to_table: :users }|
### Association
- belongs_to :user
- belongs_to :item