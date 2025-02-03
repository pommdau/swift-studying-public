# [iOS Dev Weekly - Issue 697](https://iosdevweekly.com/issues/697/)

## Comment
- iPadでゲーム開発の話？

## Swift Everywhere: Swift パッケージを Android に導入
- https://skip.tools/blog/android-native-swift-packages/
- Skipに関連して、SwiftPMをAndroidに導入する話
- Apple専用のフレームワークをAndroidでビルドしようとするとエラーになるので、インポートできるときのみこれを行うように#ifで分岐させる

```swift
#if canImport(EventKit)
import EventKit

extension EKEvent : Event {
    var dateRange: Range<Date> { self.startDate..<self.endDate }
    var isConfirmed: Bool { self.status == .confirmed }
}
#endif
```

- `import Foundation`も失敗する

>Darwin プラットフォーム (macOS、iOS、その他の Apple オペレーティング システム) では、モジュールFoundationはさまざまな機能を包括するものです。ただし、Android や Linux などの他のプラットフォームでは、Foundation複数の個別のサブコンポーネントに分割されます。

- この場合も条件付きインポートとする

```swift
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
```

- あと複数プラットフォーム用のパッケージ保守が大変なので、CIしっかりしようねという話
- 片方のプラットフォームのみの変更やビルドでOKとしてしまうことがあるため
- これを防ぐため、CIでPRのたびにビルドやテストを行うようにするといい

## 外部アクションからの起動を必要とするアプリをデバッグする

- https://tanaschita.com/xcode-debugging-app-restart/
- ディープリンクやクイックアクションなど、外部アクションによってアプリを起動する場合のデバッグ方法
- デフォルトだとシュミレーター上でアプリが強制終了すると、デバッガーがデタッチされてしまう
- そういうときはSchemeで下記を設定すると解決できる

![image](https://i.imgur.com/xOeUNnf.png)

## Swift 並行処理用語集
- https://massicotte.org/concurrency-glossary
- TBD: わからないのもあるので見直したい

## アプリからmacOSシステム全体のサービスを提供する
- https://nilcoalescing.com/blog/macOSSystemWideServices/
- Finderの右クリックのようなServicesを作る方法

![image](https://i.imgur.com/OHZDyDK.png)

## withAnimationを使用する利点

- https://www.magnuskahr.dk/posts/2025/01/advantage-of-withAnimation/
- `.animation`はスコープがローカルのViewに限定される
- 下記の場合はVStackにのみ

```swift
VStack {
    Button("Toggle content") {
        showContent.toggle()
    }
    if showContent {
        content
    }
}
.animation(.easeOut, value: showContent)
```

- この際View全体でみると瞬間的に移動するViewがでるなど微妙となる場合があるので、その場合は`withiAnimation`を使うと良い。
- これによりwithAnimation内の変更で直接/関節的に影響を受けるすべての依存Viewがアニメーション化される

```swift
VStack {
    Button("Toggle content") {
        withAnimation(.easeOut) {
            showContent.toggle()
        }
    }
    if showContent {
        content
    }
}
```

- 実行例

https://github.com/user-attachments/assets/f69083c8-64c7-4031-aedd-e8ea6fc469be

<details>
<summary>サンプルコード</summary>

```swift
import SwiftUI

struct ContentView: View {
    
    @State private var showContent = false
    
    var body: some View {

        // MARK: - animation

        VStack {
            Button("animation") {
                showContent.toggle()
            }
            if showContent {
                Rectangle()
                    .foregroundStyle(Color.red)
            }
        }
        .frame(width: 200, height: 200)
        .animation(.easeOut, value: showContent)

        // MARK: - withAnimation

        VStack {
            Button("withAnimation") {
                withAnimation(.easeOut) {
                    showContent.toggle()
                }
            }
            if showContent {
                Rectangle()
                    .foregroundStyle(Color.red)
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
```

</details>

## Objective by the Sea v7.0 のビデオ

- https://www.youtube.com/playlist?list=PLliknDIoYszuWU8jz_QzSrzlpRot4Vrn5

>Objective by the Seaイベントは、Apple プラットフォームに重点を置いたセキュリティ カンファレンスであるため、日常業務に直接関係がないかもしれません。しかし、十分に関連しているため、興味のあるものが必ず見つかるはずです。

## そして最後に...
- macOS 15から使えるクールな壁紙/スクリーンセイバ
    - https://www.theverge.com/2024/6/12/24176917/macos-sequoia-wallpaper-classic-macintosh-icons-susan-kare
- 色もランダムにできるしレトロ感が結構好き

<img width="400" alt="image" src="https://i.imgur.com/iqf8zth.png">
