# [Design an effective chart](https://developer.apple.com/videos/play/wwdc2022/110340/)

![](https://i.imgur.com/NdTkDJJ.jpg)

![](https://i.imgur.com/M8qNUlK.jpg)

- 今回は下記の一つに注目してグラフを作成する

![](https://i.imgur.com/lbeZvhA.jpg)

- グラフの目的を明らかにする。今回は下記。

![](https://i.imgur.com/vQuFKNa.jpg)

- 見せたい、必要な情報に焦点を当てる

![](https://i.imgur.com/g14mdOg.jpg)

- 今回は売上を見たい。全体や特定の日の売上を確認したい。

![](https://i.imgur.com/5IYCrrA.jpg)

![](https://i.imgur.com/CjAPfjQ.jpg)

![](https://i.imgur.com/J2i6BIl.jpg)

- 見せたい情報や目的に応じて、使用するグラフを決定する

![](https://i.imgur.com/D2nU7ci.jpg)

- 店を閉める日があった場合にはそれが悪目立ちしてしまう例。

![](https://i.imgur.com/s2YPDMs.jpg)

- 棒グラフであれば目立たない。

![](https://i.imgur.com/5uSlNqm.jpg)

- axisの範囲は静的でも動的でもいい
- 今回は売上なので動的が適している

![](https://i.imgur.com/aPMyp9V.jpg)

- 補助線があると値が見やすくなるが、必要のないグラフも存在する。
- 今回のような概要がわかればいい小さいグラフのとき

![](https://i.imgur.com/g5iNOsa.jpg)

- 詳細ビューでは補助線を記載する

![](https://i.imgur.com/I9RproB.jpg)

- 適切な密度の補助線を採用すること
- また軸の上限によって調整すること
    - また補助線は直感的な間隔、今回は20の倍数

![](https://i.imgur.com/2rXtAI2.jpg)

- コンテキストをタイトルなどで提供すること

![](https://i.imgur.com/gwN87ga.jpg)

- またInteractionによってデータの詳細を伝えられるようにすると良い

![](https://i.imgur.com/F3SHlSL.jpg)

- タッチの当たり判定は実際よりも大きくすると使いやすい

![](https://i.imgur.com/cwI8qq7.jpg)

- Accessibilityの工夫
    - 不要な情報を繰り返さない
    - 語句を省略しない
    - 大切なものを最初に持ってくる。今回でいうと日付。

![](https://i.imgur.com/TjeUDZt.jpg)

- Colorでグラフを分かりやすくする
- Colorの意味を考える

![](https://i.imgur.com/wJZn7nG.jpg)

- 文化によって色の意味が異なる事がある

![](https://i.imgur.com/xJM7QPV.jpg)

- 一方の彩度が高ければそちらが重要な情報をいう意味を持つ

![](https://i.imgur.com/r1GAr6u.jpg)

- 同じ重要度であれば違いを出さないようにする

![](https://i.imgur.com/aIoxWRo.jpg)

- 色を決定するとき、Accessibilityとよみやすさを考えること。
- 背景色も考える

![](https://i.imgur.com/yYsJfJl.jpg)

- 色盲の方のことも考える

![](https://i.imgur.com/YXN7LDq.jpg)

- ダークモード、コントラストの違いを考える

![](https://i.imgur.com/TMbGH8m.jpg)

- まとめ

![](https://i.imgur.com/qDkk9TD.jpg)
