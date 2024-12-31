# [Swift 6とStrictConcurrencyで困らないiOSアプリの作り方](https://www.youtube.com/watch?v=lu0Ge0td1Kg&ab_channel=SwiftZoomin%27)

- マイグレーションは下記を参照すれば十分

![](https://i.imgur.com/e0KDOid.jpeg)

- 0ベースからの話

![](https://i.imgur.com/BHP7ABm.jpeg)

![](https://i.imgur.com/c7rKDzC.jpeg)

![](https://i.imgur.com/mWeToi2.jpeg)

![](https://i.imgur.com/0SDISIP.jpeg)

![](https://i.imgur.com/MI3SIXd.jpeg)

![](https://i.imgur.com/NkcbrPv.jpeg)

![](https://i.imgur.com/Ebygm9U.jpeg)

- 新しくプロジェクトを作成
- Swift 5 言語モード

![](https://i.imgur.com/ERNKAhb.jpeg)

- CompleteとするとStrictConcurrecyとなる

![](https://i.imgur.com/QBcvNQz.jpeg)

![](https://i.imgur.com/mDk5Koe.jpeg)

- 今回はさっきCompleteとしたところを戻して、Swift 6言語モードで進める
- iOS18からView自体が＠MainActorになったのでつけなくて良くなった。以前はbodyのみが@MainActorだった。

![](https://i.imgur.com/OD9JdlL.jpeg)

- 純粋なEntityとして扱いたいので、気持ちの問題でimport structと書いている。structのDateを定義している感じ？

![](https://i.imgur.com/BHAIdPL.jpeg)

- `let hoge: Hoge = .init()`の形で書いている。もしinitがnilを返した場合に型が`Hoge?`であることに気づけるため。

![](https://i.imgur.com/5tSWNJC.jpeg)

- Error型は全てSendableに準拠している
