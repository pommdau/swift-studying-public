# [Swift Charts: Raise the bar](https://developer.apple.com/videos/play/wwdc2022/10137/)

## Marks and composition

![](https://i.imgur.com/52uhGkp.jpg)

![](https://i.imgur.com/uImJCMM.jpg)

- Swift Chartsの理念として、小さい構成要素を組み合わせることで実現するということがある

![](https://i.imgur.com/BIS0bcX.jpg)

- Chartsでは青い長方形がそれぞれMarkとよぶ

![](https://i.imgur.com/oAAJ2Th.jpg)

- Chartsの実装を見ていく

![](https://i.imgur.com/oOdwA5H.jpg)

- modifierでColorを設定できる

![](https://i.imgur.com/85HGdII.jpg)

- VoiceOver用の設定をカスタムできる

![](https://i.imgur.com/bdSlkLJ.jpg)

- 別のグラフの作り方

![](https://i.imgur.com/uGh100m.jpg)

- 線グラフは`LineMark`

![](https://i.imgur.com/U5VmD4Z.jpg)

![](https://i.imgur.com/tRj1kli.jpg)

![](https://i.imgur.com/jDjWRYy.jpg)

- `.foregroundStyle`で各スタイルが自動的に設定され、凡例も追加される。
- デフォルトでは視認しやすいデフォルトカラーが選択される

![](https://i.imgur.com/SojoRDL.jpg)

- 見やすいように(点の)シンボルを追加

![](https://i.imgur.com/H0MlHfK.jpg)

- ラインをなめらかにする

![](https://i.imgur.com/4RJ7TjK.jpg)

- 積み上げ棒グラフの作り方

![](https://i.imgur.com/SImUxMQ.jpg)

- グループ化する場合は`.position`を使う

![](https://i.imgur.com/GOSK2Ii.jpg)

- 他のMarkタイプのサポート

![](https://i.imgur.com/E7PGZd7.jpg)

- より複雑なグラフを考えていく

![](https://i.imgur.com/TYyLhLZ.jpg)

![](https://i.imgur.com/zDDnVWx.jpg)

- その月のなかのDailyの売上の最大値と最小値を追加する

![](https://i.imgur.com/pUssioK.jpg)

- 今回はBarMarkを使う

![](https://i.imgur.com/Ser7Wf5.jpg)

- `LineMark`を`RectangleMark`にすると今回良い見た目になる

![](https://i.imgur.com/wab22Bl.jpg)

- グラフの幅をratioで設定できる

![](https://i.imgur.com/ZlQ3xE7.jpg)

- すべての月における1日の平均売上を表示するオプションの実装

![](https://i.imgur.com/CnIAAvk.jpg)

- グラフの意味を追加するため`.annotation`を使って注釈を追加

![](https://i.imgur.com/P4VefY5.jpg)

## Plotting data with mark properties

![](https://i.imgur.com/8hR9O6y.jpg)

- Chartsで扱うデータの区分け

![](https://i.imgur.com/9s3s2bI.jpg)

![](https://i.imgur.com/wvAF8xo.jpg)

- グラフの軸は自動的に決定される。これはQuantitative Propertyがどこにあるかによる。

![](https://i.imgur.com/sO8wN9z.jpg)

![](https://i.imgur.com/oRm2Blu.jpg)

- y軸の値の範囲を`.chartYScale`で設定できる

![](https://i.imgur.com/nXgG5VQ.jpg)

- foregroundStyleを設定する方法

![](https://i.imgur.com/Q7Rpxki.jpg)

- カスタムしたX軸を作成したい。今回は月別。

![](https://i.imgur.com/f76EK3m.jpg)

![](https://i.imgur.com/m7GPEjm.jpg)

![](https://i.imgur.com/p0BQRuJ.jpg)

- これで月のラベルが1文字にすることができた。

![](https://i.imgur.com/tiigrkv.jpg)

- `value`で条件分けを行い、四半期最初の月のみ…というカスタムができる

![](https://i.imgur.com/9rqblWk.jpg)

- Y軸を`.leading`にする方法

![](https://i.imgur.com/cH01WF7.jpg)

- （Y軸を他のスタイルと調和させる？）

![](https://i.imgur.com/zlOVN12.jpg)

- 軸を非表示にする方法

![](https://i.imgur.com/UCThofT.jpg)

- 凡例を非表示にする方法

![](https://i.imgur.com/pw9KDoS.jpg)

- プロット領域を設定する方法

![](https://i.imgur.com/D0IBmLe.jpg)

- グラフ内のカテゴリの数によって動的にグラフのHeightを決定する

![](https://i.imgur.com/TyNUnRg.jpg)

- プロットエリアに背景を追加してグラフを目立たせる手法

![](https://i.imgur.com/CK2B9fA.jpg)

![](https://i.imgur.com/NnMFkwK.jpg)

- 特定のデータにアクセスるるための`ChartProxy`

![](https://i.imgur.com/nIn00qz.jpg)

- 下記の実装を考える

![](https://i.imgur.com/3a0aagn.jpg)

![](https://i.imgur.com/ZUisNTo.jpg)

![](https://i.imgur.com/Hbrhdv4.jpg)

- ChartProxyによる値の取得部分

![](https://i.imgur.com/MTbzpFO.jpg)

- 上記で取得した値の表示

![](https://i.imgur.com/Y2u11fN.jpg)

- 下記も同様の手法で実装できる

![](https://i.imgur.com/FtkmWhe.jpg)

## Wrap-up

![](https://i.imgur.com/PrH46Lp.jpg)
