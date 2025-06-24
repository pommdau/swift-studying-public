# [Embracing Swift concurrency](https://www.youtube.com/watch?v=u2rYp8AMuSg)

# Gemini

ダグがSwiftの並行処理について説明しています。彼は、並行処理をアプリに導入して応答性を高める方法と、コードを正しく記述する方法について強調しています。

ビデオの主なポイントは次のとおりです。

* **並行処理の利点**
    * ディスクからのファイルの読み取りやネットワークリクエストの実行など、データ待機時の応答性向上に役立ちます [00:00:21]。
    * 大規模な画像の処理など、時間のかかる計算をバックグラウンドにオフロードできます [00:00:27]。

* **Swiftの並行処理モデル**
    * コンパイル時に潜在的なデータ競合を特定することで、並行コードをより簡単に正しく記述できるように設計されています [00:00:46]。
    * 開発者が修正が難しいデータ競合を恐れることなく、必要に応じて並行処理を導入できるようにします [00:00:56]。

* **メインスレッドと並行処理**
    * アプリはすべてのコードをメインスレッドで実行することから始めるべきであり、UI関連のイベントを処理し、UIを更新するのはメインスレッドです [00:01:19]。
    * 高レイテンシ操作のための非同期コードの導入（例：ネットワーク経由でコンテンツをフェッチする）は、UIのハングを防ぐのに役立ちます [00:01:39]。
    * Swiftの並行処理は、UIをブロックすることなく、コードの一部をバックグラウンドスレッドで実行できるようにするツールを提供します [00:10:28]。

* **非同期タスク**
    * ネットワークリクエストなどのデータ待機時にメインスレッドを占有しないために使用できます [00:06:07]。
    * URLSession APIのようなライブラリAPIは、開発者が自分で並行処理を導入することなく、自動的にバックグラウンドで作業をオフロードできます [00:07:03]。
    * 複数の非同期タスクは、アプリが同時に多くの独立した操作を実行する必要がある場合に役立ちます [00:09:06]。

* **データの共有と競合状態**
    * Swiftは、並行コードで値が安全にアクセスされることを保証します [00:15:40]。
    * URLのような値型は、各コピーが独立しているため、安全に共有できます [00:16:16]。
    * クラスのような参照型は、同じオブジェクトが並行して変更されると、競合状態を引き起こす可能性があります [00:18:37]。
    * Swiftのコンパイラは、非センド可能型を共有しようとするとコンパイルエラーを出して、競合状態を防ぎます [00:20:10]。

* **アクター**
    * アクターは独自のデータを分離し、一度に1つのタスクのみがデータにアクセスできるようにします [00:24:42]。
    * メインアクターのように、開発者は独自の型を定義できます [00:24:50]。
    * アクターは並行処理に適しており、複数のオブジェクトをプログラム内に作成でき、メインスレッドのように単一のスレッドに縛られません [00:25:09]。

* **推奨されるビルド設定**
    * すべてのプロジェクトで「approachable concurrency」設定を有効にすることが推奨されます [00:26:49]。
    * UIと対話するSwiftモジュールでは、「default actor isolation」をメインアクターに設定することが推奨されます [00:27:05]。

このプレゼンテーションは、単一スレッドコードから始まり、待機時間を隠すための非同期タスク、バックグラウンドスレッドで実行するための並行コード、メインスレッドからデータアクセスを移動するためのアクターを導入することで、アプリがどのように進化していくかを示すロードマップを提供します [00:26:16]。

# Memo

## 00:00 - Introduction
## 03:17 - Single-threaded code
## 06:00 - Asynchronous tasks

簡単なアプリは全部メインスレッドでいいが、通信・データベースの読み込みなどはConcurrencyが必要になってくる

![](https://i.imgur.com/SqO5b1m.jpeg)

![](https://i.imgur.com/UVxqtO7.jpeg)


Swift6.2からデフォルトで`@MainActor`がつく

![](https://i.imgur.com/Aj3mSJE.jpeg)

![](https://i.imgur.com/jCqz2BR.jpeg)

![](https://i.imgur.com/1yksmwZ.jpeg)

![](https://i.imgur.com/amKL74h.jpeg)

![](https://i.imgur.com/kiEI2ic.jpeg)

## 07:24 - Interleaving

>インターリーブまたはインターリービング（英: Interleaving）は計算機科学と電気通信において、データを何らかの領域（空間、時間、周波数など）で不連続な形で配置し、性能を向上させる技法を指す。

![](https://i.imgur.com/xNfRDjZ.jpeg)

特定の順番で処理を行いたい場合は、同一Taskで実行する必要がある

![](https://i.imgur.com/qAISd1G.jpeg)

アプリの多くの処理はメインスレッドでいいが、アプリが応答しなくなったことに気づいたら、Instrumentsなどのツールが役立つ
またConcurrencyなしでも高速化できるのであれば、まずそれを試す

![](https://i.imgur.com/VsLtgYV.jpeg)

## 10:22 - Introducing concurrency

![](https://i.imgur.com/I0yo0dt.jpeg)

デフォルトでは`@MainActor`になるので、バックグラウンド実行を明示的に`@concurrent`で指定する

>[Swift 6.2 と Xcode 26 で変わる並行処理と新たなビルド設定 nonisolated(nonsending) By Default について #iOS - Qiita](https://qiita.com/1plus4/items/8c2b484977a150b32117#swift-62-%E3%81%A7%E7%99%BB%E5%A0%B4%E3%81%99%E3%82%8B-nonisolatednonsending-%E3%81%A8%E3%81%AF)
>ただし副作用として、この設定が有効な場合、連鎖するすべての呼び出し先が nonisolated(nonsending) となります。
そのため、UI層から呼び出すとほぼすべての処理が @MainActor で実行され、重い処理がメインアクターで実行される可能性があります。

これに対し、@concurrent を使うことで解決が可能です。

![](https://i.imgur.com/HCRuU5H.jpeg)

## 11:07 - Concurrent functions

![](https://i.imgur.com/b2IX8Fy.jpeg)

![](https://i.imgur.com/vGkKyus.jpeg)

![](https://i.imgur.com/drMn9MY.jpeg)

## 13:10 - Nonisolated code

`@concurrent`: 常にバックグラウンドで実行する場合
`nonisolated`: 呼び出し側で実行を選べる

![](https://i.imgur.com/9W6nPE1.jpeg)

公開するライブラリであれば`nonisolated`をつけるのが良い

![](https://i.imgur.com/tZgC9JQ.jpeg)

## 14:13 - Concurrent thread pool

処理は複数のバックグラウンドスレッドにわたって行われることもある
(同一関数内でもスレッドが切り替わることもあるという理解で良さそう)
効率のよい使われ方をする

![](https://i.imgur.com/egRY1FX.jpeg)

## 14:58 - Sharing data
## 15:49 - Value types

スレッドにわたって変数が渡される例

![](https://i.imgur.com/qNBIAXa.jpeg)

`url`は値型でコピーされて別スレッドに渡される
値型はコピーされて独立しているので安全
`@MainActor`の場合は明示的な`Sendable`は不要

![](https://i.imgur.com/EDdLenU.jpeg)

## 17:16 - Actor-isolated types

![](https://i.imgur.com/t4ptpjx.jpeg)

![](https://i.imgur.com/3NjaOQc.jpeg)

## 18:30 - Classes

![](https://i.imgur.com/qgB5NHB.jpeg)

![](https://i.imgur.com/ukO7TFI.jpeg)

解決策は同一Task内で行うこと
`displayImage`は`@MainActor`上で行う必要があるのでawait

![](https://i.imgur.com/FUBT3BR.jpeg)

下記の通り書き直せる

![](https://i.imgur.com/v6LXCuL.jpeg)

![](https://i.imgur.com/Iag8uyM.jpeg)

![](https://i.imgur.com/9qEWJOo.jpeg)

モデルクラスは大体メインアクターだろう
またSendableにはめったにならない
`Non-Sendable`であることで、逆に一部の変数がバックグラウンドで更新される、など複雑な状況になりにくいメリットがある
Sendableにする場合はraw-levelのロック機能が必要だろう

![](https://i.imgur.com/Y7C5hm1.jpeg)

`image`がキャプチャーされる例
Sendableにするのは、並行して共有する必要がある場合にのみにしてください

![](https://i.imgur.com/7yZ2SB3.jpeg)

状態の変更を行ってから、他のTaskに送信すること

![](https://i.imgur.com/h7y9tyz.jpeg)

## 23:18 - Actors

![](https://i.imgur.com/9LIaUf7.jpeg)

![](https://i.imgur.com/iwM3tGy.jpeg)

![](https://i.imgur.com/8n9L6vP.jpeg)

![](https://i.imgur.com/SGqo3zd.jpeg)

Actorの使い所

![](https://i.imgur.com/7K1s0h7.jpeg)

![](https://i.imgur.com/cShI8UX.jpeg)

おすすめのビルド設定
`Approachable concurrency`: Concurrencyの実装を助けてくれる設定？

![](https://i.imgur.com/YahKHdW.jpeg)

## 26:12 - Wrap-up

![](https://i.imgur.com/tm9kDnT.jpeg)
