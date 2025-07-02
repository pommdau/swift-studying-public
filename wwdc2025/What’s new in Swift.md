# [What’s new in Swift](https://www.youtube.com/watch?v=Pvf8OLnAUGI&ab_channel=AppleDeveloper)

## Development workflow

![](https://i.imgur.com/SVAQKCr.jpeg)

swiftly: Swiftのバージョン管理(Pythonのuv的な?)

![](https://i.imgur.com/pPLBhH1.jpeg)

![](https://i.imgur.com/UGNCDo5.jpeg)

![](https://i.imgur.com/kAheKdF.jpeg)

AppStoreに出す場合はXcodeの選択が必要

![](https://i.imgur.com/1ySegpH.jpeg)

![](https://i.imgur.com/PRZyI7J.jpeg)

サイトも見やすくなっている

![](https://i.imgur.com/MjurEPX.jpeg)

![](https://i.imgur.com/sDvqAgK.jpeg)

![](https://i.imgur.com/45fclXC.jpeg)

VSCodeのSwiftの拡張機能も充実

![](https://i.imgur.com/PJh9QFN.jpeg)

DocCのプレビューもいい感じ

![](https://i.imgur.com/EHe1LG4.jpeg)

マクロのビルド改善

![](https://i.imgur.com/gOXWKb2.jpeg)

swift-syntaxのビルドはキャッシュ可能だったが、Clean Buildに時間がかかっていた。

![](https://i.imgur.com/Z5xpanR.jpeg)

事前ビルド済みの依存関係をサポートし、ビルドのステップが短縮できた。
（この辺よくわからないですね）

![](https://i.imgur.com/XgBfGNl.jpeg)

警告の設定を細かくできる

![](https://i.imgur.com/LAWu1Sw.jpeg)

![](https://i.imgur.com/7sWeA75.jpeg)

![](https://i.imgur.com/v1fNM7q.jpeg)

タスク名が見えたりと、非同期処理が追いやすくなった

![](https://i.imgur.com/xO9e1Oa.jpeg)

![](https://i.imgur.com/2PHgFh4.jpeg)

![](https://i.imgur.com/lj1XcXW.jpeg)

## Libraries

![](https://i.imgur.com/qnbfvnS.jpeg)

![](https://i.imgur.com/flsE0Hd.jpeg)

- `Subprocess`の登場

![](https://i.imgur.com/cnHpELs.jpeg)

![](https://i.imgur.com/tQMfMW5.jpeg)

![](https://i.imgur.com/BIdnvZZ.jpeg)

![](https://i.imgur.com/rTi8CqD.jpeg)

![](https://i.imgur.com/jKikATQ.jpeg)

既存のNotificationの問題
キー名を間違ったらだめ
型情報がないのでキャストが必要で面倒

![](https://i.imgur.com/HCdM6rc.jpeg)

`.main`としてもMainActorのエラーが出ることがある

![](https://i.imgur.com/yO5Shct.jpeg)

新しい書き方で上記の問題が解決される

![](https://i.imgur.com/Pee5xZn.jpeg)

メッセージの型でMain/Asyncの設定が可能？

![](https://i.imgur.com/y4CBq1C.jpeg)

![](https://i.imgur.com/zCP6acG.jpeg)

![](https://i.imgur.com/OtspH4g.jpeg)

Swift6.2から`Observatrions`により変更の監視ができる

![](https://i.imgur.com/3PaMhJN.jpeg)

監視の期間

![](https://i.imgur.com/GXix5Nl.jpeg)

2つプロパティを変更した場合も、取得される更新後の値は1つで効率がいい　

![](https://i.imgur.com/2JUd87l.jpeg)

`for await`で反復処理も可能
(これえあれば更新された値を逐次読み取ることができる？)

![](https://i.imgur.com/Bkn9GEo.jpeg)

![](https://i.imgur.com/cn34h5b.jpeg)

- 参考になる: [WWDC 2025 Swiftの新機能・変更点まとめ - ライブラリ編 #WWDC2025 - Qiita](https://qiita.com/TsukasaHasegawa/items/10351adc3a16b8fd64e9)

![](https://i.imgur.com/UbEIJLA.jpeg)

![](https://i.imgur.com/tcDjtHr.jpeg)

`precondition`で例えばnumber変数が条件を満たさない場合に、throwsを使わずにテストを終了できる

![](https://i.imgur.com/xXqCTvz.jpeg)

先程のnumberの取得で失敗することを期待するテスト

![](https://i.imgur.com/mzwnzFn.jpeg)

## Swift throughout the stack

![](https://i.imgur.com/ddNnvht.jpeg)

![](https://i.imgur.com/TkyrgZW.jpeg)

![](https://i.imgur.com/4SiFwWB.jpeg)

![](https://i.imgur.com/xvWJLdh.jpeg)

![](https://i.imgur.com/CEnaWMw.jpeg)

![](https://i.imgur.com/Muv4rxw.jpeg)

Cとの依存関係でSwiftでもポインタが必要な場合がある
Swift6.2からは危険な箇所に明示的に`unsafe`をつける必要がある

![](https://i.imgur.com/pCSL9Ce.jpeg)

![](https://i.imgur.com/ujaErpE.jpeg)

![](https://i.imgur.com/66Fl2gf.jpeg)

![](https://i.imgur.com/lAIdyBk.jpeg)

(よくわからず。このアプリで扱うデータをセキュアにしているくらい？)

![](https://i.imgur.com/NB3eYB1.jpeg)

サーバサイドの話

![](https://i.imgur.com/gXRIRyt.jpeg)

Swiftを活用したバックエンドのサービスで、多くのリクエストを捌いている

![](https://i.imgur.com/Uzgth4P.jpeg)

その中でパスワードアプリのパスワード漏えいの機能の部分の改善を行った

![](https://i.imgur.com/LTryVqm.jpeg)

![](https://i.imgur.com/Q6ptFr4.jpeg)

ThingsをSwiftで書き直した例

![](https://i.imgur.com/6fQ4mk2.jpeg)

すごく改善している

![](https://i.imgur.com/xam3jSK.jpeg)

![](https://i.imgur.com/onfXtX7.jpeg)

![](https://i.imgur.com/v0RtgQf.jpeg)

サーバエコシステムでJavaが多く使われているが、Swiftを段階的に使うこともできる

![](https://i.imgur.com/7TRyqvs.jpeg)

そのためのライブラリ

![](https://i.imgur.com/1P3251r.jpeg)

まだExperimentalなことだけ留意

![](https://i.imgur.com/9mvJ7cC.jpeg)

![](https://i.imgur.com/oxT836S.jpeg)

![](https://i.imgur.com/yBMqYMt.jpeg)

![](https://i.imgur.com/H4zzLq5.jpeg)

![](https://i.imgur.com/USElvni.jpeg)

![](https://i.imgur.com/lWEbu1x.jpeg)

![](https://i.imgur.com/tbNd60L.jpeg)

WASMを利用している例

![](https://i.imgur.com/oVrzWmJ.jpeg)

## Language evolution

![](https://i.imgur.com/AxV8QSW.jpeg)

![](https://i.imgur.com/0gSlXCq.jpeg)

Arrayの動き
ヒープ割当の詳細
要素を超えた場合、新しいメモリを作り、前のものを削除する必要がある

![](https://i.imgur.com/yjvKpKG.jpeg)

![](https://i.imgur.com/zsv7Lii.jpeg)

![](https://i.imgur.com/o62eL8t.jpeg)

![](https://i.imgur.com/QlSLoHx.jpeg)

![](https://i.imgur.com/jJV4dRB.jpeg)

![](https://i.imgur.com/0UQGJ2F.jpeg)

![](https://i.imgur.com/qlN3khg.jpeg)

![](https://i.imgur.com/TJ5ETrS.jpeg)

![](https://i.imgur.com/wms5Rnj.jpeg)

![](https://i.imgur.com/lR9bpSj.jpeg)

詳細は以下(このセッションだとSpanの説明がなくてよく分からないのでチェックしておきたい)

![](https://i.imgur.com/xBf0ro4.jpeg)

![](https://i.imgur.com/wQjeRd2.jpeg)

スティッカーを抽出する例
`photoProcessor`がバックグラウンドでアクセスされ、データ競合が起きる可能性がある

![](https://i.imgur.com/P0P07Bn.jpeg)

Swift6.2ではこれが見直される
デフォルトではシングルスレッドで実行されるようになる

![](https://i.imgur.com/U3ITzGX.jpeg)

呼び出し下のActor領域内で実行され、データ競合が起きなくなる
（プログラマの概念的には従来通りメインスレッド・バックグラウンドスレッドでそれぞれ処理をするが、内部的には同一スレッドで実行されるイメージだろうか？）

![](https://i.imgur.com/Gm0nGql.jpeg)

次の別の話

![](https://i.imgur.com/mXwrBhJ.jpeg)

![](https://i.imgur.com/dPOPt1X.jpeg)

![](https://i.imgur.com/K2fFEqj.jpeg)

![](https://i.imgur.com/yq6n6kC.jpeg)

`StickerModel`は`MainActor`なので、nonisolatedの場合はアクセスできない

![](https://i.imgur.com/dK959FC.jpeg)

![](https://i.imgur.com/GcxTBmq.jpeg)

![](https://i.imgur.com/9D4BEo5.jpeg)

並行処理が少ない一般のアプリであれば、クラス全体につけてもいい

![](https://i.imgur.com/6VwHf6S.jpeg)

こういうパターンが多いので、これからはデフォルトで`MainActor`となるオプションを追加した

![](https://i.imgur.com/C9eOwa5.jpeg)

これによりデータ競合が防止できるメリットが有るし、コードもシンプルに保たれる

![](https://i.imgur.com/56F597G.jpeg)

![](https://i.imgur.com/48B2lcU.jpeg)

例

![](https://i.imgur.com/XAQJUFD.jpeg)

まずはキャッシュをもたせる構成にする

![](https://i.imgur.com/0SDjZvM.jpeg)

`extractSubject`が重たい処理なのでMainActorでは実行したくない
その場合は`@concurrent`をつける

![](https://i.imgur.com/cW7DEcT.jpeg)

![](https://i.imgur.com/xJdCYpP.jpeg)

![](https://i.imgur.com/3DZbO1B.jpeg)

![](https://i.imgur.com/ZRuBkLu.jpeg)

![](https://i.imgur.com/L3EGTFK.jpeg)

移行ツールもあるよ

![](https://i.imgur.com/1gBU8zT.jpeg)
