# 概要
## 公式
- [Launching | Apple Developer Documentation](https://developer.apple.com/design/human-interface-guidelines/launching)
- [アプリの起動画面の指定 | Apple Developer Documentation](https://developer.apple.com/documentation/xcode/specifying-your-apps-launch-screen)
- これを読む限りだとルートビューのモックを表示する(TabViewだけあってコンテンツが空のようなもの)、みたい。
- でもこの画像をどうやって用意するんだという問題がある。画面サイズ毎に作るのは…設定も恐らくできない。
- 古い実装?だとStoryboardがあるので多分その想定とは思う。

![image](https://i.imgur.com/n5ASqVI.png)

- ただ現在の設定ではなさそうなので、現在のペストプラクティスを知りたい
  - 後述の通り背景色やアイコンだけの簡単なやつで良いのかもしれない

## その他

- AppleとしてはLanuchScreenと呼ぶ(Splash Screenは存在しない)
- とりあえずロゴを表示したりなどのブランディングをするのはアンチパターン
- SwiftUIで検索するとRootのOnAppearでDispatchQueueで一定秒表示する例があるが絶対アンチパターンだろう
- デバイスの性能が上がり起動が早くなった今、そんなにこだわらなくてもいいのかも
  - [Splash screen vs Launch screen in iOS | Sarunw](https://sarunw.com/posts/splash-screen-vs-launch-screen/)
  - [雰囲気でLaunchScreenをやっていた](https://zenn.dev/ryomm/articles/a9852f1b09b6b8)
  - [iOS16時代のLaunch ScreenとInfo.plistとSwiftUI #Xcode - Qiita](https://qiita.com/Hackenbacker/items/85c8f785c2df6f1f7534#%E8%83%8C%E6%99%AF%E8%89%B2%E3%81%AE%E8%A8%AD%E5%AE%9A)

>今時のLaunch Screenはカスタマイズして作るものではなくなりました。
>Info.plistでLaunch Screenを設定するのであれば、
>デフォルト設定のままで良い。(systemBackground背景色のみ)
>設定したとしても背景色のみで十分。
>iOS16でアップル純正のプリインストールアプリをいくつか調査しましたが、特別なLaunch Screenは設定されておらず、デフォルト設定となっているようです。

- 変更確認はシュミレータを再起動する点に注意。不便〜
    - https://stackoverflow.com/questions/66927229/launch-screen-added-from-info-plist-is-not-working-for-swiftui-2-0-in-ios14-0
