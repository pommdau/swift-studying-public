# [iOS Dev Weekly - Issue 676](https://iosdevweekly.com/issues/676)

# [Skip](https://skip.tools/blog/skip-1_0-release/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20676)
- SwiftUIでクロスプラットフォームのやつ。個人利用なら無料枠もできる。
- パトロン的なやつ(FlutterのGoogleポジション)がつくまではちょっと依存するのも怖いか。

# [SWIFT BUILD TIMES AND MODULE VERIFICATION…](https://pfandrade.me/blog/swift-build-times-and-module-verification/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20676)

- マルチモジュール構成でビルドが遅い

>I finally took some time to investigate this and built the project with timing summaries1. The reasoning behind all this slowness became immediately clear…
>コンパイラは、Secrets のビルドにかかった 3.5 分間のほとんどをモジュールの検証に費やしていることは明らかです...

- Xcodeの`Product > Perform Action > Build with Timing Summary`で時間がかかっている箇所を調べられる

![](https://i.imgur.com/Z1fNktp.jpeg)

![](https://i.imgur.com/kxATfcD.jpeg)

- `ENABLE_MODULE_VERIFIER`がYESなのが問題そう。少なくともデバッグビルドでは必要ないだろう。
    - https://developer.apple.com/documentation/xcode/identifying-and-addressing-framework-module-issues
- これで改善した！
- 定期的に`Timing Summary`を確認しようね、というまとめ。

## [SwiftOpenAIProxy](https://swiftpackageindex.com/PicoMLX/PicoAIProxy?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20676)
- OpenAI APIを使うときに、キーを取られないようにプロキシサーバーを立てるためのやつかなという理解

## [JavaScript to Swift and back: Bridging location services in WKWebView](https://swiftlybald.com/javascript-to-swift-and-back-bridging-location-services-in-wkwebview/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20676)
- 未読

## [Send data Between iOS Apps and Extensions Using Darwin Notifications](https://ohmyswift.com/blog/2024/08/27/send-data-between-ios-apps-and-extensions-using-darwin-notifications/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20676)
- 未読
- iOSアプリとExtension間でデータのやり取りをするときのもの？

## [Apple Repaired My iPhone Screen, but Now My Social Media Account Is Banned](https://www.finnvoorhees.com/words/banned-iphone/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20676)
- デバイスの唯一性とは、という話。
- iOSでこの辺のセキュリティはしっかりしている

> iOS 開発者として、Apple が開発者がユーザーを追跡するために使用できるすべての API を厳しく取り締まっていることは知っています。開発者はデバイスのシリアル番号にアクセスできず、identifierForVendorユーザーがベンダーのアプリをすべて削除するとシリアル番号はリセットされます。では、Snapchat はどのようにしてデバイスを認識できるのでしょうか?

- `DeviceCheck`というのがある
    - https://developer.apple.com/documentation/devicecheck
- 2bitの4状態を保存できる
- 使いみちは以下の通り

> アプリで クラスを使用するとDCDevice、ユーザーのプライバシーを維持しながら、サーバー上でデバイスごとに 2 桁の 2 進数データを設定および照会するために使用するトークンを取得できます。たとえば、このデータを使用して、提供しているプロモーション オファーをすでに利用しているデバイスを識別したり、不正であると判断したデバイスにフラグを付けたりすることができます
