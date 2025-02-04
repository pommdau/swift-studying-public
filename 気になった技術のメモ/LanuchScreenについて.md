# 概要
- AppleとしてはLanuchScreenと呼ぶ(Splash Screenは存在しない)
- [アプリの起動画面の指定 | Apple Developer Documentation](https://developer.apple.com/documentation/xcode/specifying-your-apps-launch-screen)
  - これを読む限りだとルートビューのモックを表示する(TabViewだけあってコンテンツが空のようなもの)、みたいだけど、情報が古いかもしれない
- とりあえずロゴを表示したりなどのブランディングをするのはアンチパターン
- SwiftUIで検索するとRootのOnAppearでDispatchQueueで一定秒表示する例があるが、これは非常に良くなさそう
- デバイスの性能が上がり起動が早くなった今、そんなにこだわらなくてもいいのかも
  - [Splash screen vs Launch screen in iOS | Sarunw](https://sarunw.com/posts/splash-screen-vs-launch-screen/)
  - [雰囲気でLaunchScreenをやっていた](https://zenn.dev/ryomm/articles/a9852f1b09b6b8)
  - [iOS16時代のLaunch ScreenとInfo.plistとSwiftUI #Xcode - Qiita](https://qiita.com/Hackenbacker/items/85c8f785c2df6f1f7534#%E8%83%8C%E6%99%AF%E8%89%B2%E3%81%AE%E8%A8%AD%E5%AE%9A)

>今時のLaunch Screenはカスタマイズして作るものではなくなりました。
>Info.plistでLaunch Screenを設定するのであれば、
>デフォルト設定のままで良い。(systemBackground背景色のみ)
>設定したとしても背景色のみで十分。
>iOS16でアップル純正のプリインストールアプリをいくつか調査しましたが、特別なLaunch Screenは設定されておらず、デフォルト設定となっているようです。

- シュミレータを再起動しないと変更確認できないのは確かにそうみたい
    - https://stackoverflow.com/questions/66927229/launch-screen-added-from-info-plist-is-not-working-for-swiftui-2-0-in-ios14-0
