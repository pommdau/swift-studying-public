# [Swift 6へのアプリの移行 - WWDC24 - ビデオ - Apple Developer](https://developer.apple.com/jp/videos/play/wwdc2024/10169/)

![](https://i.imgur.com/QPZ4yok.jpeg)
![](https://i.imgur.com/mznzmIL.jpeg)
Swift6にすることでデータ競合が防げるメリットが有る
既存のコードはもちろん将来的にもメリットが大きい
ライブラリをメンテナンスしている場合はユーザがSwift6を享受できるように早く対応しようね

![](https://i.imgur.com/7b5ISHt.jpeg)
これらを一つずつ対応しよう、まとめてリファクタリングまでするのは難しい

![](https://i.imgur.com/XrpIejN.jpeg)
Strict Concurrencyを有効にするフラグ
警告のみ表示でビルドは可能

![](https://i.imgur.com/7fXob6y.jpeg)
## グローバル変数の例
どのスレッドから利用されるかが保証されていないのが問題

![](https://i.imgur.com/q6twJiL.jpeg)
メインスレッドで利用するならば、@MainActorをつけてもいい

![](https://i.imgur.com/Iplv73q.jpeg)
コンパイラで検知できないDispatchQueueなどでスレッドセーフにしているなら`nonisolated(unsafe)`と書ける
最終手段ではある、もしかしたらリファクタリングしたほうがいいかも

![](https://i.imgur.com/g6pxUer.jpeg)
グローバル変数はSwiftではパフォーマンスのため遅延呼び出しされる、CやObjcは起動時に初期化される
この遅延呼び出しの競合は心配する必要はない、Atomicに生成されるため

## シングルトンの例

![](https://i.imgur.com/oPyKHxp.jpeg)

Taskやawaitにするか、または呼び出し関数に@MainActorをつける。もちろんViewなどのMainActor外から呼ばれていればコンパイラがエラーを出す

![](https://i.imgur.com/vADunUA.jpeg)


コールバックのスレッド保証の話は、ドキュメントに書いてある場合もある

![](https://i.imgur.com/Mm38wLF.jpeg)
任意のスレッドの場合もある
この場合はユーザがスレッドセーフに呼び出す必要がある


![](https://i.imgur.com/VcrOqQf.jpeg)

@MainActorのメソッドが@MainActorに準拠していない？のでnonisolatedをつける
メインスレッドでの呼び出しが保証されていないため

![](https://i.imgur.com/VTEgZQd.jpeg)

![](https://i.imgur.com/IxjCWXC.jpeg)

![](https://i.imgur.com/XstuHjM.jpeg)
SDKが更新されていない場合、
`assumeIsolated`か`@preconcurrency`が利用できる
メインアクター外で呼ばれた場合はトラップ(ハングアップ？）されるが、クラッシュするよりはまし。

![](https://i.imgur.com/tHOmJZa.jpeg)
![](https://i.imgur.com/Nz8nxMk.jpeg)

## Swift6モード

- Concurrencyの警告が消えたので、Swift6を有効にする

![](https://i.imgur.com/cpb6Qv1.jpeg)

- ライブラリが対応して`@preconcurrency`が必要なくなった場合は、その警告をちゃんと出してくれる

![](https://i.imgur.com/qLmAUtW.jpeg)

![](https://i.imgur.com/TEU5eLS.jpeg)

![](https://i.imgur.com/9uaGkUy.jpeg)
- 最初にやるのは簡単なことから行って警告を減らしていく
    - メソッドを@MainActorにおく、グローバル変数をvarからletにするなど
- 根本原因を探って、それを解決することで数百の問題が解決できるかも
- 新しいXcodeを使うと注釈も新しくなっているかも

![](https://i.imgur.com/KpoQYET.jpeg)
- 一度に全部対応する必要はなく、一度フラグを戻してもいい
- 修正した箇所は進捗になるので

![](https://i.imgur.com/HNuTSeJ.jpeg)
internalな型ではSendableに推論されるが、publicな型では推論されない
パッケージの作成者が変更する可能性があるから

![](https://i.imgur.com/r5fdl0A.jpeg)

もし参照型でSendableにできない型を持っている場合、クラスを保護して変数をprivateにしてSendableとみなすのも一案。
その場合は`nonisolated(unsafe)`を使うと、DrinkTypeはSendableとしてコンパイルされる

![](https://i.imgur.com/24jCSgz.jpeg)

delegateのコールバックはドキュメントによると、CLManagerを呼び出したスレッドになる
今回MainActorでCLManagerを利用しているので、このdelegateメソッドを@MainActorに配置すればいい

![](https://i.imgur.com/IZNFWUP.jpeg)
![](https://i.imgur.com/A7CnAHF.jpeg)



