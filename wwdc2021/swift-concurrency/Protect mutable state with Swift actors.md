# [Protect mutable state with Swift actors](https://developer.apple.com/videos/play/wwdc2021/10133)

![](https://i.imgur.com/v6rKNU7.jpg)

- 下記の書き方では実行のタイミングが保証されない

![](https://i.imgur.com/AiyI1EN.jpg)

- 値型を使う…？

![](https://i.imgur.com/alHzFyt.jpg)

![](https://i.imgur.com/lSQCrTO.jpg)

- データ競合を防ぐにはいろいろな方法がある
- 各々に利点があるが、きちんと実装しないとデータ競合が起こってしまう問題が共通してある

![](https://i.imgur.com/uRSF17D.jpg)

- そこでアクター

![](https://i.imgur.com/h7lOAXH.jpg)

![](https://i.imgur.com/OfrAZ9x.jpg)

![](https://i.imgur.com/31997Vu.jpg)

![](https://i.imgur.com/6Nku0Bc.jpg)

![](https://i.imgur.com/bHG4SlT.jpg)

- キャッシュを確認して、同じ画像をダウンロードしないようにする

![](https://i.imgur.com/kk6KfH8.jpg)

- 今の状態では画像を2度ダウンロードして上書きされてしまうバグが有る

![](https://i.imgur.com/S9ZAwBH.jpg)

- 解決方法の一つは、エントリを一回しか登録させないこと
- ただし重複してダウンロード処理は走ってしまう問題があるので、それは関連動画で紹介する。

![](https://i.imgur.com/2CXiX3C.jpg)

- actorをEquatableプロトコルに適合させてみる

![](https://i.imgur.com/sHG8l0P.jpg)

![](https://i.imgur.com/X2FBwEL.jpg)

![](https://i.imgur.com/EZJs5Wr.jpg)

![](https://i.imgur.com/8hrbNS1.jpg)

![](https://i.imgur.com/TyMMDVj.jpg)

- Task.detachedは別スレッドで競合する可能性があるので、
- awaitを使って非同期にしないといけない

![](https://i.imgur.com/LwOszR1.jpg)

- Bookのタイトルを変更しようとすると競合が起こってしまう
- これを解決するのがSendable

![](https://i.imgur.com/ZWAhfoZ.jpg)

![](https://i.imgur.com/HOVupVH.jpg)

- Sendableへの適合のさせ方

![](https://i.imgur.com/DIx7qCl.jpg)

![](https://i.imgur.com/PAucIoU.jpg)

![](https://i.imgur.com/VClFeFx.jpg)

![](https://i.imgur.com/znZKL46.jpg)

## MainActor

![](https://i.imgur.com/HvmvORa.jpg)

![](https://i.imgur.com/AVT50Jd.jpg)

![](https://i.imgur.com/59H1wIS.jpg)

![](https://i.imgur.com/KMmg7vj.jpg)
