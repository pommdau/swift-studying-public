# [Explore structured concurrency in Swift](https://developer.apple.com/videos/play/wwdc2021/10134)

- Structured programmingは読みやすい
- しかしclosureを使う非同期処理ではこうなっていない問題がある

![](https://i.imgur.com/xJDHdrB.jpg)

![](https://i.imgur.com/cQTH40t.jpg)

![](https://i.imgur.com/YJCNvVX.jpg)

- async/awaitによる改善

![](https://i.imgur.com/pcXhaMq.jpg)

![](https://i.imgur.com/K7UbZ19.jpg)

![](https://i.imgur.com/sHSs1a7.jpg)

![](https://i.imgur.com/FRnwspK.jpg)

![](https://i.imgur.com/qx0iG1C.jpg)

- `async let`の時点でダウンロードは始まる
- また次の`following statements`の処理に移っている

![](https://i.imgur.com/gRdGcWb.jpg)

- `await result`は`URLSession.shared.data(...)`の終了を待つ

![](https://i.imgur.com/ffj8npa.jpg)

![](https://i.imgur.com/t0qc3wy.jpg)

- これを並列にダウンロードするには`async let`を使う

![](https://i.imgur.com/1xgaEfI.jpg)

- 並列ダウンロードをしていて、先に`metadata`のダウンロードに失敗した場合、`data`のダウンロードはキャンセル済みとして自動的にマークされる。
- マークされただけでは実際にTaskはキャンセルされず、結果が不要になったことだけがTaskに通知される。

![](https://i.imgur.com/RPSWTW9.jpg)

- 親のTaskがキャンセルされると、自動的に子のTaskもキャンセルされる

![](https://i.imgur.com/bekerA9.jpg)

- 全タスクが完了すると`fetchOne`はエラーを出して終了する

![](https://i.imgur.com/ludPKW2.jpg)

- 実際にTaskが終了するのはいつなのか。

![](https://i.imgur.com/wtyaEZG.jpg)

![](https://i.imgur.com/FY152kp.jpg)

- 処理時間が長いAPIを作るときはキャンセルを考慮しないといけない

![](https://i.imgur.com/YqNKqrU.jpg)

![](https://i.imgur.com/xkYExjF.jpg)

- サムネイルの画像を取得・作成するイテレート毎にチェックを行い不要なサムネイルまで取得させないようにする

![](https://i.imgur.com/rRRoQ2j.jpg)

- こういう書き方もできる
- この場合は取得している画像までは返り値まで含めていることがポイントです。
- この場合部分的に結果を返すことをAPIが明確に示す必要がある

![](https://i.imgur.com/rDixyWn.jpg)

![](https://i.imgur.com/dzUlayp.jpg)

- 全サムネイルの取得を並列にしたい

![](https://i.imgur.com/dq91lR9.jpg)

- taskGroupのスコープは`featchThumnails`内まで

![](https://i.imgur.com/nKt8xdM.jpg)

- groupに追加されると`Child Task`はすぐに実行される
- groupのスコープを抜けると、その中のタスクの完了を待機する

![](https://i.imgur.com/TD1PEAR.jpg)

![](https://i.imgur.com/3Hb5wJL.jpg)

- 現状はデータ競合があるので実行時エラーとなる
- Swiftではこれを静的チェックする

![](https://i.imgur.com/l7jJjkp.jpg)

![](https://i.imgur.com/RJ59D9E.jpg)

![](https://i.imgur.com/aZ9cnBI.jpg)

![](https://i.imgur.com/ph1zZjk.jpg)

- 完了した順番に実行されるので、安全に辞書に追加できる

![](https://i.imgur.com/fiFEwfC.jpg)

- `for in`で使えるデータを作るには以下セッションを参照

![](https://i.imgur.com/H3vVskK.jpg)

![](https://i.imgur.com/kGAFJb3.jpg)

![](https://i.imgur.com/LkUCx3U.jpg)

- これはUIKitのDelegateでよく見られる

![](https://i.imgur.com/FGrZ0Ml.jpg)

- `Task`のスコープをdelegate method外としたい

![](https://i.imgur.com/yL0A9XM.jpg)

![](https://i.imgur.com/X9R5w4l.jpg)

![](https://i.imgur.com/w3FtjQM.jpg)

![](https://i.imgur.com/Wbr9oRR.jpg)

![](https://i.imgur.com/Al4lYrL.jpg)

- サムネイルがダウンロード完了前に必要なくなったとき、Taskのキャンセルを手動で行う必要がある。

![](https://i.imgur.com/rym9fPT.jpg)

![](https://i.imgur.com/10pu2Il.jpg)

- 外部からCancelを呼び出せる

![](https://i.imgur.com/hBchPuz.jpg)

- もとのcontextを継承しないTaskが`Detached tasks`

![](https://i.imgur.com/PeaIU7Z.jpg)

![](https://i.imgur.com/pu2DOwK.jpg)

- キャッシュにサムネイルを保存する例
- `@MainActor`のcontextも必要ないので`Task.detached`が適している
- 優先度はUIに影響しない`.background`

![](https://i.imgur.com/mw1t03g.jpg)

- 複数の`.background`の処理を行いたい場合はgroupにまとめる
- 利点としては`Task.detached`をキャンセルすれば子タスクがまとめてキャンセルできる点。

![](https://i.imgur.com/HewYrvr.jpg)

![](https://i.imgur.com/HZoumdQ.jpg)

![](https://i.imgur.com/FWCnANZ.jpg)
