# [What’s new in privacy](https://developer.apple.com/jp/videos/play/wwdc2024/10123/)
- Appleのアプリ開発者はユーザの信頼に応える責任がある
- セキュリティの実装も簡単ではない
- 下記が柱
    - 機能に必要な最小限の情報のみ取得
    - オンデバイスで実行してサーバー上に情報を漏洩するリスクを減らす
    - 情報の用途を透明性を持って公開して、またユーザが制御できるようにする
    - これを実現するセキュリティ技術

![](https://i.imgur.com/vC8AMBz.jpeg)

![](https://i.imgur.com/yuEqPFq.jpeg)

![](https://i.imgur.com/0boursD.jpeg)

![](https://i.imgur.com/8qXfsGs.jpeg)

- Pickerで選択し、ユーザが選択した支出だけをアプリに渡すことができる

![](https://i.imgur.com/kBDMbXj.jpeg)

- ユーザがアプリに公開する情報の範囲を選択できる

![](https://i.imgur.com/EVgep3F.jpeg)

![](https://i.imgur.com/zKBpSDt.jpeg)

![](https://i.imgur.com/ptQuO6u.jpeg)

- 途中経過は渡さず、最終的に作成された画像のみをアプリに情報を渡すことができる

![](https://i.imgur.com/UUuJoRb.jpeg)

- ペアリングする際、希望するペアリング対象以外は検出できないようにしていて、安心してユーザが利用できるように

![](https://i.imgur.com/0SmAWRy.jpeg)

![](https://i.imgur.com/qNbWJkl.jpeg)

![](https://i.imgur.com/PZiPSS4.jpeg)

![](https://i.imgur.com/WNXpytp.jpeg)

![](https://i.imgur.com/R1NgJM4.jpeg)

![](https://i.imgur.com/KrNKWam.jpeg)

![](https://i.imgur.com/pPiFQdz.jpeg)

![](https://i.imgur.com/pN6zLKv.jpeg)

![](https://i.imgur.com/g58NTa1.jpeg)

![](https://i.imgur.com/WHkoncI.jpeg)

- アプリの裏にあるextensionsの存在がユーザにはわかりにくい問題がある

![](https://i.imgur.com/pSsxjrs.jpeg)

- 通知が行くように。また設定でこれらを無効にもできる

![](https://i.imgur.com/gxOVM4U.jpeg)

![](https://i.imgur.com/2pqMEdF.jpeg)

- 下記のサポート廃止
- [macOS 15 Sequoiaでは、DirectoryServicesプラグインやレガシーなQuickLookプラグイン、com\.apple\.loginitems\.plistが廃止されるので、古いMacからアップデートする際には注意を。](https://applech2.com/archives/20240617-deprecated-features-in-macos-15-sequoia.html)

![](https://i.imgur.com/7kFlwtd.jpeg)

![](https://i.imgur.com/9y5pR2I.jpeg)

![](https://i.imgur.com/e5CjZ5N.jpeg)

- 非サンドボックスであれば、ダイアログで許可さえすればアクセスできる

![](https://i.imgur.com/8FjBsx3.jpeg)

- 同一開発者のアプリグループ間で情報共有する場合

![](https://i.imgur.com/Ts9OpB4.jpeg)

- すべてSandbox化できていない場合も、グループコンテナで一部の情報を保護できる

![](https://i.imgur.com/7qiaeor.jpeg)

- ユーザの写真や閲覧利敵などプライバシー性の高いものなどが適している

![](https://i.imgur.com/03Q0idC.jpeg)

- 同じグループコンテナを利用する場合に許可ダイアログを表示しないようにするには以下の対応が必要

![](https://i.imgur.com/uOvX6xe.jpeg)

![](https://i.imgur.com/wPCViSa.jpeg)

![](https://i.imgur.com/YQ8dRHK.jpeg)

- 二段階でユーザに許可を求める

![](https://i.imgur.com/4lyNr9o.jpeg)

![](https://i.imgur.com/dDbfUtY.jpeg)

![](https://i.imgur.com/l7Nimzj.jpeg)

![](https://i.imgur.com/Azx4OKt.jpeg)

- Bluetoothのペアリングでは、一意のMACアドレスや位置情報が含まれる。これを公開することを許可ダイアログで分かりやすくした。

![](https://i.imgur.com/AA0yite.jpeg)

![](https://i.imgur.com/cQrzcDi.jpeg)

![](https://i.imgur.com/wBoG2Sd.jpeg)

- 交友関係が分かってしまう問題

![](https://i.imgur.com/fOPXDkw.jpeg)

![](https://i.imgur.com/byjFvV3.jpeg)

- plistでユーザに明確に使途を伝えること

![](https://i.imgur.com/CkXxhi5.jpeg)

![](https://i.imgur.com/eQ0VfVt.jpeg)

![](https://i.imgur.com/coj0r8Y.jpeg)

![](https://i.imgur.com/h76DIe8.jpeg)

![](https://i.imgur.com/5Aw3tGr.jpeg)

![](https://i.imgur.com/lFn4wV1.jpeg)

![](https://i.imgur.com/YyXaAHT.jpeg)

- パスキーはパスワードよりセキュアな手法

![](https://i.imgur.com/REFYMOb.jpeg)

- パスワードを利用しているアプリなどはパスキーのサポートを追加することをおすすめする
- パスキーはパスワードと連携する

![](https://i.imgur.com/deWasIG.jpeg)

![](https://i.imgur.com/n1FxBzX.jpeg)

- この辺はちょっとわからず

![](https://i.imgur.com/H9AYZC5.jpeg)

![](https://i.imgur.com/ov5fvnX.jpeg)

![](https://i.imgur.com/ffDDzfy.jpeg)

![](https://i.imgur.com/b4Agk8Z.jpeg)
