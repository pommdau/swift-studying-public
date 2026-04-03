# [SwiftUI foundations: Build great apps with SwiftUI | Meet with Apple - YouTube](https://www.youtube.com/watch?v=Z3vloOtZLkQ)

- ソースコード: https://developer.apple.com/documentation/swiftui/wishlist-planning-travel-in-a-swiftui-app
- 質問一覧: https://antongubarenko.substack.com/p/swiftui-foundations-build-great-apps

![](https://i.imgur.com/yXA9zNq.jpeg)

描画は、コードと値の結果である

![](https://i.imgur.com/HI3MPng.jpeg)

![](https://i.imgur.com/ID2QzR5.jpeg)

欲しい機能のブレインストーミング

![](https://i.imgur.com/rPBsaho.jpeg)

![](https://i.imgur.com/GcduSTz.jpeg)

![](https://i.imgur.com/KBrl8vo.jpeg)

タブの数を少なく保ってシンプルなものにしよう
ユーザにとって予測可能で意思決定を減らす
タブバーはデフォルトが推奨、アニメーションやアクセシビリティなどの機能が失われる可能性があるため。他のところで個性を出そう。

![](https://i.imgur.com/O4LckiZ.jpeg)

まずHIGを見よう

![](https://i.imgur.com/24pg4MF.jpeg)

Appleのリソースを活用しよう

![](https://i.imgur.com/LjoJ9nz.jpeg)

![](https://i.imgur.com/JwSdX50.jpeg)

![](https://i.imgur.com/BqjjHX5.jpeg)

戻るボタン、Editボタンでシンプルかつわかりやすくする

![](https://i.imgur.com/QkSQUm8.jpeg)

複雑すぎて悪い例

![](https://i.imgur.com/gZqn3sC.jpeg)

高度な作業はMore Menuに隠す

![](https://i.imgur.com/kciZ6UH.jpeg)

ボタンを目立たせる方法
目立たせるのは一つだけにする

![](https://i.imgur.com/WG2Tgzm.jpeg)

Listはテキストベースのコンテンツに適している

![](https://i.imgur.com/qWo52AZ.jpeg)

画像やサブタイトルで一見してわかりやすいようにする

![](https://i.imgur.com/uFNbpwo.jpeg)

画像やビデオはコレクションが適しているだろう
ここでいうCollectionsとはScrollView+LayzyVGridのこと

![](https://i.imgur.com/sovoeL4.jpeg)

Sectionタイトルやカード名があってわかり易い例

![](https://i.imgur.com/uduTUBD.jpeg)


単に画像の羅列だとわかりにくい
またランダムな行数のテキストも見にくく、全体を見たときのバランスが悪い

![](https://i.imgur.com/lpegNvS.jpeg)

適切なタイトルを使って階層構造を伝える
例えば、セクションのタイトルは`.title3`

![](https://i.imgur.com/d8HZt6h.jpeg)

Expandedなどフォントを使い分ける

![](https://i.imgur.com/8MS9dbP.jpeg)

アクセントカラーを決めておく

![](https://i.imgur.com/feMOFnS.jpeg)

強調したい箇所にのみSemanticではない色を使う

>https://developer.apple.com/jp/design/human-interface-guidelines/color/#Specifications
>カスタムカラーを定義する場合は、明るいバリアントとダークバリアント、および各種バリアントのコントラストを上げたオプション（視覚的に非常に見分けやすいもの）をご用意してください。ガラスが適応できるようにしてください。

![](https://i.imgur.com/Tcditxl.jpeg)

スペースを使って、バランスがとれて洗練されているかを考えること
複数の画面を通して一貫したUIにすることで、ユーザにとって負担が少なくなる

![](https://i.imgur.com/IHMf1T8.jpeg)

![](https://i.imgur.com/Ise6M8o.jpeg)

ViewとDataの関係性の実装

![](https://i.imgur.com/0ULhdtQ.jpeg)

![](https://i.imgur.com/57mVKLk.jpeg)

ColorやImageはできる限り大きいスペースを要求する
一方テキストは最小限のスペースを要求

![](https://i.imgur.com/rIxozXD.jpeg)

優先度が高いレイアウトを`.layoutPriority()`で設定できる

![](https://i.imgur.com/k9HEiuf.jpeg)

- `ViewThatFits`によってスペースに余裕があれば日付けを表示するレイアウト
- [ViewThatFits を使ってアダプティブレイアウトを作成する方法 - 無料の SwiftUI by Example チュートリアル](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-an-adaptive-layout-with-viewthatfits)

![](https://i.imgur.com/0xle6ow.jpeg)

alignmentの種類もたくさんある

![](https://i.imgur.com/WoKjBkA.jpeg)

`.listRowSeparatorLeading`はよく使えそう

![](https://i.imgur.com/VyNKWcR.jpeg)

使用例

![](https://i.imgur.com/kTH86r0.jpeg)

![](https://i.imgur.com/v7S8IPQ.jpeg)

![](https://i.imgur.com/irGNqeP.jpeg)

まとめ
・様々な画面の大きさに適応できるように動的なレイアウトで実装する、frameを直接指定しない
・ZStackではなく`.background`や`.overlay`を利用してレイアウトの計算をViewの中に閉じ込めてシンプルにする？

![](https://i.imgur.com/U3dQcXG.jpeg)

Viewのレイアウトを視覚的に示すデバッグ用テクニック

![](https://i.imgur.com/BOC8wZl.jpeg)

printだけだとVoidが返ってエラーになるので、一旦変数に取るよくあるテクニック

![](https://i.imgur.com/leelPIu.jpeg)

![](https://i.imgur.com/lnPzRLs.jpeg)

![](https://i.imgur.com/81S1y6D.jpeg)

![](https://i.imgur.com/885zofL.jpeg)

画像を始点にZoomできる
こうした小さい工夫がアプリの印象を良くする

![](https://i.imgur.com/sR04P2I.jpeg)

シートの表示

![](https://i.imgur.com/orPq5lY.jpeg)

ボタンを起点にZoom遷移できる

![](https://i.imgur.com/hAvOKys.jpeg)

- ScrollViewとスワイプ動作のカスタマイズ
- https://developer.apple.com/documentation/swiftui/view/scrolltargetbehavior(_:)

![](https://i.imgur.com/maJ4YTq.jpeg)

スクロール中に少し変形させる例

![](https://i.imgur.com/Kwe8uRd.jpeg)

![](https://i.imgur.com/CQXoKb7.jpeg)

SFSymbolsのアニメーション

![](https://i.imgur.com/lnSRfC4.jpeg)

![](https://i.imgur.com/AAwaqFA.jpeg)

丸からチェックマークがアニメーションする例

![](https://i.imgur.com/HqGNmNd.jpeg)

![](https://i.imgur.com/aLXsSC6.jpeg)

`.animation`で個々のアニメーションを設定できる

![](https://i.imgur.com/6f8avHt.jpeg)

数字のアニメーションをつけられる

![](https://i.imgur.com/MeBf2H8.jpeg)

.bouncy: 遊び心がある
.snappy: 目標島で素早く、正確さとプロフェッショナルを感じさせる
.smooth: Appleデフォルト
.spring: ユーザの遊び心で調整できる

![](https://i.imgur.com/fZmwWSn.jpeg)

![](https://i.imgur.com/tWzF3Gv.jpeg)

弾むボール

![](https://i.imgur.com/iaKmA3z.jpeg)

![](https://i.imgur.com/utdVxdy.jpeg)

![](https://i.imgur.com/5KEYmwH.jpeg)

![](https://i.imgur.com/uKyVgIW.jpeg)

![](https://i.imgur.com/0AlciCy.jpeg)

![](https://i.imgur.com/3HCni9T.jpeg)

![](https://i.imgur.com/oktcy0O.jpeg)

Transitionのアニメーション

![](https://i.imgur.com/se9Oo5A.jpeg)

![](https://i.imgur.com/iBqYmFJ.jpeg)

![](https://i.imgur.com/fh9DP6I.jpeg)

![](https://i.imgur.com/LA2WlbT.jpeg)

![](https://i.imgur.com/IqzfmRy.jpeg)

データフローの話

![](https://i.imgur.com/wULGwow.jpeg)

追加画面のシートの例

![](https://i.imgur.com/XZMAaSv.jpeg)

![](https://i.imgur.com/c2JWkrX.jpeg)

![](https://i.imgur.com/1iLyQXd.jpeg)

![](https://i.imgur.com/HXuKdDt.jpeg)

![](https://i.imgur.com/47XAtNK.jpeg)

![](https://i.imgur.com/MEwHnrw.jpeg)

![](https://i.imgur.com/XADRegV.jpeg)

![](https://i.imgur.com/U7V7ymX.jpeg)

![](https://i.imgur.com/915zho1.jpeg)

DataSourceの管理方法
アプリのとDataSourceの生存期間が一致しているため

![](https://i.imgur.com/b6BzdqL.jpeg)

ただこれだと階層ごとに渡すのが大変なため、`.environment`を利用する

![](https://i.imgur.com/af4nHor.jpeg)

![](https://i.imgur.com/nP0Te8W.jpeg)

![](https://i.imgur.com/kPW0B95.jpeg)

設定はView間で共通させたい

![](https://i.imgur.com/xoJAfvB.jpeg)

![](https://i.imgur.com/B55ILSq.jpeg)

アプリの設定にベストな使い道

![](https://i.imgur.com/ZOOJp4k.jpeg)

こういうデータはSwiftDataなどに保存するのが適している

![](https://i.imgur.com/PyI5bGm.jpeg)

![](https://i.imgur.com/oKof5j8.jpeg)

![](https://i.imgur.com/xYWgZi4.jpeg)

![](https://i.imgur.com/csnTxCo.jpeg)

![](https://i.imgur.com/n0WlnbJ.jpeg)

![](https://i.imgur.com/G9MFR5G.jpeg)

![](https://i.imgur.com/DW88miS.jpeg)

![](https://i.imgur.com/ibUPC5o.jpeg)

![](https://i.imgur.com/vbNpRhl.jpeg)

![](https://i.imgur.com/37A2CRC.jpeg)

![](https://i.imgur.com/y8HdkMJ.jpeg)

- SwiftUIの利点
    - 明確なステート管理
    - コードのコンパクト化


![](https://i.imgur.com/hQBIm30.jpeg)

HostingViewを使ってSwiftUIを静かに取り入れる

![](https://i.imgur.com/FioEPUG.jpeg)

コアの安定した箇所は書き直す必要がないのでそのままに

![](https://i.imgur.com/rxAqnLi.jpeg)

SwiftUIは下記で利用する

![](https://i.imgur.com/FHVu7tn.jpeg)

独立したSheetなどはSwiftUIで実装できるだろう

![](https://i.imgur.com/LcqIvjU.jpeg)

SwiftUIはデザインシステムの構築に向いている
Previewでそれぞれ表示している例

![](https://i.imgur.com/P7jSHdM.jpeg)

ViewModelのデータとViewのバインディングのためのコードが減り33%削減できた

![](https://i.imgur.com/8uWYSYJ.jpeg)

![](https://i.imgur.com/FsUj8HP.jpeg)

プルリクエストも小さくなり、コードレビューも迅速になった

まとめ
UIKitは安定さをもたらしてくれる
また複雑なColelctionやNavigationの実装には必要

![](https://i.imgur.com/1f6U4RH.jpeg)

SwiftUIはより開発を加速させてくれる

![](https://i.imgur.com/MjD4erf.jpeg)

SwiftUIを導入すべきか

![](https://i.imgur.com/EmVPJkP.jpeg)

![](https://i.imgur.com/W24gOYg.jpeg)

![](https://i.imgur.com/JmUzgYt.jpeg)

momentum: PRの規模の縮小やコードレビューの速度など

![](https://i.imgur.com/Sy8cC3f.jpeg)
