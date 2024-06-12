# [Meet async/await in Swift](https://developer.apple.com/videos/play/wwdc2021/10132/)

![](https://i.imgur.com/4yLT8Oz.jpg)

- 時間がかかる処理

![](https://i.imgur.com/ChDRvyD.jpg)

![](https://i.imgur.com/qHl7z15.jpg)

![](https://i.imgur.com/qHl7z15.jpg)

- completionを呼び出すのを忘れがち問題

![](https://i.imgur.com/VXbzUkV.jpg)

![](https://i.imgur.com/d1GGZtU.jpg)

- バグの温床

![](https://i.imgur.com/rmpjwyA.jpg)

- `Result<>`を使う方法もあるが可読性は下がる

![](https://i.imgur.com/HGU6rco.jpg)

![](https://i.imgur.com/G8GiTu2.jpg)

![](https://i.imgur.com/tsb769A.jpg)

- propertyもawaitにできる

![](https://i.imgur.com/IcCr6IZ.jpg)

- 実装例

![](https://i.imgur.com/fbON6f7.jpg)

- for-inでもawaitが使える

![](https://i.imgur.com/pgXGCZ2.jpg)

![](https://i.imgur.com/gqDMxMI.jpg)

- 非同期タスクを並列に実行するのは以下のセッションを見る

![](https://i.imgur.com/gMGvjEB.jpg)

- 通常の関数ではスレッドを専有して処理が行われ、返り値でエラーを返す

![](https://i.imgur.com/A2jplmo.jpg)

- asyncでは実行するかどうかは一旦Systemに委ねられる
- 優先度が高い順に実行され、自動的にresumeして実行される

![](https://i.imgur.com/hdCEsUu.jpg)

- 問題なく終了すれば元のスレッドに処理を返す

![](https://i.imgur.com/9nC7bpC.jpg)

![](https://i.imgur.com/0dV5Uix.jpg)

![](https://i.imgur.com/sfr5Lgi.jpg)

![](https://i.imgur.com/LcL9Rtv.jpg)

![](https://i.imgur.com/i2JdkeG.jpg)

![](https://i.imgur.com/S1guooa.jpg)

- テスト化めっちゃシンプルに書ける…！（asyncにしたことでwaitがなくなった？）

![](https://i.imgur.com/9jgyFNU.jpg)

- 実装例を見ていく

![](https://i.imgur.com/YeKWyH4.jpg)

![](https://i.imgur.com/WaytwSl.jpg)

![](https://i.imgur.com/ENyOYeo.jpg)

![](https://i.imgur.com/ApA1Ve4.jpg)

- completionを置き換える話

![](https://i.imgur.com/ndY920c.jpg)

![](https://i.imgur.com/i1WP0fd.jpg)

- Swiftコンパイラによって下記は自動で用意される？

![](https://i.imgur.com/wwew1rr.jpg)

![](https://i.imgur.com/1ykC130.jpg)

- `get`の命名を消すのをおすすめする
- 

![](https://i.imgur.com/LCIkHCS.jpg)

- `handler`の呼び出しが不要になった。

![](https://i.imgur.com/YyuBc6S.jpg)

![](https://i.imgur.com/Dpbb7Qp.jpg)

- 自分でasyncに置き換える

![](https://i.imgur.com/CYK4ehw.jpg)

![](https://i.imgur.com/ku8izgs.jpg)

![](https://i.imgur.com/t7fcmeZ.jpg)

![](https://i.imgur.com/i16DcTa.jpg)

- 実装するときの注意

![](https://i.imgur.com/eFMx3Qb.jpg)

![](https://i.imgur.com/JSryXk1.jpg)

![](https://i.imgur.com/36vrBJo.jpg)

- 別の例
- continuationを記録して、適切にresumeさせる必要がある

![](https://i.imgur.com/a2NntNn.jpg)

![](https://i.imgur.com/H8YY6Oc.jpg)

- 最後にnilを入れることで2回以上の呼び出し(fatalError)を起きないようにする

![](https://i.imgur.com/3vHTphx.jpg)

- LowLevelの話は以下

![](https://i.imgur.com/XT8kVpi.jpg)

