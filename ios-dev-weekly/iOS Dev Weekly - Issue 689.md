# [iOS Dev Weekly - Issue 689](https://iosdevweekly.com/issues/689)

## Comment

### OpenAI の新しい o1-preview を試してみた

- 特徴の一つはコードの作成が得意
- 整理した情報を JSON にエクスポート変換させるコードを書かせてみた。
- 一回出力止まった以外は良かった。
- 2 回のプロンプト 30 分未満ででき、自分の書くコードよりも優れていた。

### Cursor

- 使い勝手はいい感じ。
- コード行やコードブロックの提案だけでなく、連続しない箇所の変更もサジェストしてくれる
- Cursor は開いている全てのタブを文脈として使用することで LLM モデルを活用している

## [Alex Sidebar](https://alexsidebar.app/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)

- AI アシスタントツール
- チャットスタイルのインターフェースがある
- チャットやコード生成ができる

![image](https://i.imgur.com/zJJjJub.png)

## [Animate UIKit views with SwiftUI animations in iOS 18](https://nilcoalescing.com/blog/AnimateUIKitViewsWithSwiftUIAnimations/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)

- iOS18 から SwiftUI のアニメーションを UIKit で使える話
- [animate\(\_:changes:completion:\)](https://developer.apple.com/documentation/uikit/uiview/4463009-animate)
- [Animation](https://developer.apple.com/documentation/swiftui/animation)
- SwiftUI の API の利点として、アニメーションの定義や繰り返しの定義が簡単
- SwiftUI/UIKit 間のアニメーションの統一ができて UX が向上する

```swift
import UIKit
import SwiftUI

class ViewController: UIViewController {
    private var animatingView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimatingView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimating()
    }

    private func setupAnimatingView() {
        animatingView = UIImageView(
            image: UIImage(systemName: "volleyball.fill")
        )
        animatingView?.tintColor = .systemPink
        animatingView?.contentMode = .scaleAspectFit
        animatingView?.frame = CGRect(
            origin: .init(x: 0, y: 0),
            size: .init(width: 80, height: 80)
        )
        view.addSubview(animatingView!)
        animatingView?.center = view.center
    }

    @available(iOS 18.0, *)
    private func startAnimating() {
        let animation = SwiftUI.Animation
            .linear(duration: 1.3)
            .repeatForever()

        UIView.animate(animation) { [weak self] in
            self?.animatingView?.transform = .init(scaleX: 2, y: 2)
        }
    }
}

#Preview {
    ViewController()
}
```

## [Introducing Swift Testing\. Basics\.](https://swiftwithmajid.com/2024/10/22/introducing-swift-testing-basics/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)

- Swift Testing の簡単な紹介
- Concurrency との相性もいいらしい

## [My favorite Thanksgiving tradition…](https://hachyderm.io/@holly/113529485876308571?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)

- モジュールがシングルスレッドを選択できるようにするというアイデアがあるとのこと
  - [Improving the approachability of data\-race safety](https://github.com/hborla/swift-evolution/blob/approachable-concurrency-vision/visions/approachable-concurrency.md?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)
- 詳しくは理解できず。

## [In-app settings to adjust every aspect and get things just right](https://bsky.app/profile/andy.works/post/3lbgbhko6ec22?utm_campaign=iOS+Dev+Weekly&utm_medium=web&utm_source=iOS+Dev+Weekly+Issue+689)

- アプリのインタラクションのパラメータを調整するのに、プロトタイプにフロートウインドウを追加してリアルタイムで微調整できるようにすると良い。

![image](https://i.imgur.com/Z034rk4.png)

## [Delicious Library](https://arstechnica.com/gadgets/2004/11/delicious-library/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)

- 昔大きな人気があったアプリ
- [Amazon のフィードが停止したため](https://mastodon.social/@wjs/113539330521476328?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20689)アプリはクローズされた。
