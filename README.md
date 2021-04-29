# README

## アプリケーション名
My Album Cutest

## アプリケーションの仕様
このアプリケーションは個人のアルバムシェアアプリです。
専用のLineChatBot に投稿された画像or動画を読み取り、アプリ内動画•画像を別けて保存します。
保存された画像や動画はアプリ内で閲覧できます。
アプリ内では投稿されている写真にメッセージを追加する事ができます。
また、日付検索に対応しています。

## URL
https://cutest-35042.herokuapp.com/

## Basic認証
ID: maripoyo PW: sa41233818

## 課題
### ペルソナ
29歳男性 出身地愛知県、宮城県在住、既婚。
最近子供が生まれ、子供の写真や動画を撮り、地元の両親、祖父母と共有したいと考えるが、妻が撮った写真も全て自身で管理して都度両親祖父母へ送信するのが面倒。
妻と両親と祖父母の共有アルバムをlineで作成すれば良いが、結婚したとはいえ妻と自分の両親祖父母は他人であり、断りはしないが乗り気でも無いと感じる。
専用のHPに写真を投稿して、電子アルバムを共有する方法も考えたが、都度HPに写真動画を投稿しにいくのは非常に手間だと感じる。
### 目指したアプリ
lineと同程度の手軽さで動画像を投稿できる少人数向けの動画像シェアアプリケーション
## 洗い出した要件
-- lineチャットボットによる動画像の投稿

-- 動画•画像の検索機能

-- 動画像にメッセージを添付する機能

## テーブル設計

### uploaders テーブル

|   Column           |   Type   |   Options                 |
|--------------------|----------|---------------------------|
| line_id            |  string  | null: false               |
| name               |  string  | null: false               |

### assosiation
- has_many :photos


### photos テーブル

|   Column           |   Type   |   Options                 |
|--------------------|----------|---------------------------|
| image              |  string  | null: false               |
| photo_date         |  date    | null: false               |

### assosiation
- belongs_to :uploader
- has_many :messages

### messages テーブル
|   Column           |   Type   |   Options                 |
|--------------------|----------|---------------------------|
| name               |  string  | null: false               |
| text               |  text    | null: false               |
| pohoto_id          | references | null: false             |

### assosiation
- belongs_to :photo

## ER図

[![Image from Gyazo](https://i.gyazo.com/6a4cb28eda6a004c6c96ad8f703620e8.png)](https://gyazo.com/6a4cb28eda6a004c6c96ad8f703620e8)