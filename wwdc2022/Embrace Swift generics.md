# [Embrace Swift generics](https://developer.apple.com/videos/play/wwdc2022/110352/)

- hay: 干し草
- Alfalfa: アルファルファ。かいわれ大根みたいなやつ？干し草の刈り取る前とか？
- 同じようなコードを作らないといけなくなってしまう。

![](https://i.imgur.com/8w8Ivrd.jpg)

![](https://i.imgur.com/f9Kb0Ks.jpg)

- ポリモーフィズムにも種類がある。関数を型ごとに定義する。
- コレは一般的ではない、さっき見たように同じコードを書くことになるので。

![](https://i.imgur.com/q151V7L.jpg)

- Subtype Polymorphism
    - super classの引数にとる関数をつくることで共通のインターフェースを提供する
    - [Swiftと3種類のポリモーフィズム](https://qiita.com/shtnkgm/items/fcc1a1a75895a31df4a9)がわかりやすい

![](https://i.imgur.com/jCmZG9v.jpg)

- `parametric polymorphism`が今回の対象。
- super classが呼び出されるまでfatalErrorとならない問題がある。
- 引数の型もバラバラで管理しづらい。

![](https://i.imgur.com/xnSKCKo.jpg)

- eatの引数にAnyを使う方法もある
- ただしこちらも型チェックするまでfatalErrorとならない問題がある

![](https://i.imgur.com/F633hdQ.jpg)

- 以下のやり方は、実際のクラスの中身には興味がないのに記載しないといけない問題がある。

![](https://i.imgur.com/vURQPQV.jpg)

- 今実装したい2つのもの
- ここで出てくるのがProtocol

![](https://i.imgur.com/aLhF6ss.jpg)

- クラスの宣言時ではなく、eatを宣言するときにのみFeedの型を決定してやれば良いという利点がある。

![](https://i.imgur.com/OHKyDnP.jpg)

![](https://i.imgur.com/0B9ElBm.jpg)

- よくある方法だが、someでよりシンプルに書ける

![](https://i.imgur.com/HHg7G3G.jpg)

- whereや<A>の表現と同じ意味だが、簡潔に書くことができている。

![](https://i.imgur.com/tUfJEHg.jpg)

- `:some Animal`とする場合初期値が必要。
- また別のAnimalは代入不可。

![](https://i.imgur.com/wZTSFAW.jpg)

- Swift5.7からパラメータ位置でのsomeが使えるようになった。

![](https://i.imgur.com/a3VdVP7.jpg)

- 返り値にsomeを使う場合は、戻り値から型が推測される。

![](https://i.imgur.com/KBGZnf3.jpg)

- 当然someは一意でないといけない

![](https://i.imgur.com/KAloVGp.jpg)

- ただし`@ViewBuilder`を使いreturnをなくすことで、`ViewBuilder`型で結果が構築されることになる。

![](https://i.imgur.com/DB9zIDd.jpg)

![](https://i.imgur.com/gJ1AtWB.jpg)

![](https://i.imgur.com/aksBrU3.jpg)

![](https://i.imgur.com/bbNjsAI.jpg)

- 型情報が削除され、実際の型は実行時のみ知ることができる

![](https://i.imgur.com/MQb2oGq.jpg)

![](https://i.imgur.com/31gDpyY.jpg)

- anyの文脈でsomeのように扱えない問題がある

![](https://i.imgur.com/gIJcMDd.jpg)

![](https://i.imgur.com/YQ6NBJD.jpg)

- someを使ったfeedの文脈に渡すことで、anyからsomeを取り出すことができる。

![](https://i.imgur.com/Qxds1bp.jpg)

![](https://i.imgur.com/zJtQqrr.jpg)
- 基本はsome。どうしても異種間を扱いたい場合にanyを使う。

![](https://i.imgur.com/FsAzvaZ.jpg)

- まとめ
    - 具体的な例で反復する問題に気づいた。
    - Protocolによるジェネリクス化。
    - そこでsome, anyを使い表現を完結にした。
    - someを使っていこうね！

![](https://i.imgur.com/jPOMaPq.jpg)






