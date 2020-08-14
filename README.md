# アプリ名
My Opinion

# 概要
　この作成物の主な機能は、トピックを作ったり、誰かのトピックに意見を投稿したりできたりします。
ユーザー登録をしプロフィール登録などの機能もあります。

# 制作背景（意図）
　大きく理由が二つあります。一つ目は、近年社会問題になっている、SNS関連の誹謗中傷による被害。時には人の命を奪ってしまうこの問題に対するSNSの本当のあるべき姿というのを考えたのがきっかけです。
二つ目は、SNSを通した政治批判や芸能界のスキャンダルなどへの意見です。私はニュースなどを見た後に、自分の頭で考えた後、理解ができなかった部分や専門的な意見を見たくなるのでSNSを使い調べるのですが出てきた意見は果たして正しいのか、その意見を述べている人はどういった経験をしどういった学歴があるのかがわからないため、このような制作物を作ることにしました。

# DEMO

![スクリーンショット 2020-08-14 15 03 31](https://user-images.githubusercontent.com/67148273/90218758-9148e180-de3f-11ea-8863-8c8a8c41aa07.png)

![スクリーンショット 2020-08-14 15 03 11](https://user-images.githubusercontent.com/67148273/90218845-c1908000-de3f-11ea-94de-9a4855e807cb.png)

![スクリーンショット 2020-08-14 15 03 59](https://user-images.githubusercontent.com/67148273/90218912-eb49a700-de3f-11ea-9c33-cab4fdfa2fad.png)

![スクリーンショット 2020-08-14 15 04 21](https://user-images.githubusercontent.com/67148273/90218961-04eaee80-de40-11ea-87f2-368212f123de.png)






# 実装予定の内容
　今後実装予定の機能は大きく分けて３つあります。１つ目は気になるトピックや意見をいいね登録することで、後から見返すことができる「いいね機能」です。２つ目はトピックをカテゴリー・キーワードから簡単に検索できる検索機能です。３つ目は投稿からそのユーザーのマイページへいける機能です。その他にも小さな機能をつけたいと思っていますが、大まかな機能としては以上の３つです。






# DB 設計

## postsテーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| content | text | null:false |
|topic_id | bigint | null:false |
| user_id | bigint | foreign_key: true |
| topic_id | index | foreign_key: true |

### Association
- belongs_to :topic
- belongs_to :user




## topicsテーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| title | string | limit:255 |
| user_id | bigint | foreign_key: true |

### Association
- has_many :post


## usersテーブル

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| email | string | null:false, unique: true |
| encrypted_password | string | null:false |
| reset_password_token | string | unique: true |
| reset_password_sent_at | datetime ||
| remember_created_at | datetime ||
| nickname | string | null:false |
| profile_text | text ||
| profile_image |text ||

### Association
- has_many :posts, dependent: :destroy