# [iOS Dev Weekly - Issue 674](https://iosdevweekly.com/issues/674)

## [NFC & SE Platform for secure contactless transactions](https://developer.apple.com/support/nfc-se-platform/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20674)

```
**NFC+SE**は、モバイル端末やICカードなどに関連する技術で、2つの要素を組み合わせたシステムです。

1. **NFC（Near Field Communication）**: 近距離無線通信技術の一種で、10cm以内の距離でデータをやり取りできる技術です。NFCは、電子マネーの支払い、交通機関のICカード、鍵の代わりなどに使われています。

2. **SE（Secure Element）**: セキュアなデータの保存や、機密情報のやり取りを安全に行うための専用のハードウェア領域です。SEは、暗号化されたデータや決済情報、認証情報などを保管するために利用されます。SEは、専用のICチップやSIMカードの中に組み込まれていることが多いです。

**NFC+SE**とは、NFC機能とSEを組み合わせた技術で、特に**セキュリティが要求される近距離通信**（例：モバイル決済や電子チケット）に使われます。この組み合わせによって、モバイル端末で安全に支払いを行ったり、認証を受けたりすることが可能になります。

### 主な用途：
- **モバイル決済**: NFCでデータを送信し、SEに保存されたカード情報や支払い情報を安全に扱う。
- **交通系ICカード**: NFCを使って改札を通過し、SEに保存された乗車履歴や電子マネー残高を管理。
- **デジタルID**: NFCとSEを使って、個人認証を安全に行う。
```

- この画面とかで使えるってことだろうか。

<img width="400" alt="image" src="https://i.imgur.com/TbiUtWb.png">

>この機能でサイド/ホームボタンの「ダブルクリック」が利用可能になるのは驚きです。👍

- キーとかは実現性のある用途としてありそう。
- ちゃんと審査がある。

## [String Catalog](https://stringcatalog.com/)
- 有料だけどローカライズのPRを自動で作成してくれるサービス

## [Concurrency Step\-by\-Step: A Network Request](https://www.massicotte.org/step-by-step-network-request?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20674)
- 基礎からSwift Concurrencyの実例を実装してわかりやすくて良かった。
- `task`や`MainActor.run`のバッドプラクティスということも覚えておく

```swift
import SwiftUI

struct ContentView: View {
    
    @State private var cgImage: CGImage?
    
    var body: some View {
        LoadedImageView(cgImage: cgImage)
            .task {
                // SwiftUIのViewは\@MainActorなので、Task内はメインスレッドで実行される
                // ただしloadImageAsync内の処理のスレッドがどうかは問わない
                // self.cgImageの更新はメインスレッドで行われる(勿論メイン必須)
                self.cgImage = await loadImageAsync()
            }
    }
    
    /// 非同期の画像の取得
    /// Viewの画像の更新までは行わず、画像取得までとすることで実行スレッドを明確にできる
    /// nonisolated: Actorの推論を止める。ここではMainAcrotではなくバックグラウンドスレッドで実行されることを意味する
    private nonisolated func loadImageAsync() async -> CGImage? {
        let request = URLRequest(url: URL(string: "https://robohash.org/hash-this-text.png")!)
        guard
            // URLSessionのメソッドのスレッドの如何は問わない
            let (data, _) = try? await URLSession.shared.data(for: request),
            let provider = CGDataProvider(data: data as CFData)
        else {
            return nil
        }
        return CGImage(
            pngDataProviderSource: provider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent
        )
    }
}

struct LoadedImageView: View {
    let cgImage: CGImage?
    
    var body: some View {
        if let cgImage {
            Image(cgImage, scale: 1.0, label: Text("Robot"))
        } else {
            Text("no robot yet")
        }
    }
}

#Preview("ContentView") {
    ContentView()
}

#Preview("LoadedImageView") {
    LoadedImageView(cgImage: nil)
}
```



## [Recursive enums in Swift](https://nilcoalescing.com/blog/RecursiveEnumsInSwift/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20674)
- enumで再帰させる方法: `indirect`
- 例としてフォルダ構成のenum

```swift
enum FileSystemItem {
    case file(name: String)
    case folder(name: String, items: [FileSystemItem])
    indirect case alias(name: String, to: FileSystemItem)
}
```

## [An Initial Hands\-On with SwiftCloud](https://swifttoolkit.dev/posts/hello-swift-cloud?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20674)

## [Developer guide to Swift AWS Lambdas](https://www.polpiella.dev/developer-guide-to-swift-aws-lambdas/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20674)
