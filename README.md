# アプリ名

- GorillaDiary

### URL 
http://18.180.23.62/

### テストアカウントのID及びpassword
- ID(email): a@a.sample
- password：aaaaaaaa

### ログイン時のサンプル画像
- トップページ
![トップページ](https://user-images.githubusercontent.com/59679612/77407844-24826b80-6dfa-11ea-9886-d2d0ce670d38.png)
- 日記一覧ページ
![トップページ](https://user-images.githubusercontent.com/59679612/77407844-24826b80-6dfa-11ea-9886-d2d0ce670d38.png)
- マイページ
![トップページ](https://user-images.githubusercontent.com/59679612/77407844-24826b80-6dfa-11ea-9886-d2d0ce670d38.png)
# 特徴

- １日１回しか投稿ができない。
- ゴリラでインパクトを与える。

# 制作背景

- 最近では、機械の発達やネットの進化に伴い、時間や選択の自由が増えました。
例えば、Twitterなど自分の意見を多くの人に伝えることができる場が増えたと言うことや
Youtubeなどの動画投稿サイトで自分の好きな時間に好きなものを見ることができるようになりました。
このように便利かつ自由になった今の時代の中でも、あえて制限された楽しみ方もあるということをみんなに感じてもらいたいと私は思いました。/

- ・制限された楽しみ方とは
人間は制限することで逆にやりたいと言う心理現象が起きます。
そして、制限されていない時よりも楽しさ、達成感を感じることができます。
1日1回しか投稿できないのでお気に入りユーザーの次の投稿への期待感、ワクワク感じることができます。
1日1回なので情報量が多くなりすぎず、ユーザーの生活に支障をきたにくい。

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
