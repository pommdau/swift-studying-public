# [iOS Dev Weekly - Issue 673](https://iosdevweekly.com/issues/673)

## General
- [Existential thoughts about Apple’s reliance on Services revenue](https://sixcolors.com/post/2024/08/existential-thoughts-about-apples-reliance-on-services-revenue/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20673)
- Appleのサービスの利益がハードウェアの利益を上回った
- 現在のアプリのビジネスモデルは以下
- 頑張ってそういうアプリの一つになろうね

>現在、App Store の価格設定は、サブスクリプションが主要なビジネス モデルとして定着しています。主要なアプリのほとんどは、月額 3 ～ 6 ドル、または年間 30 ～ 60 ドルの価格に落ち着いています。一部のアプリでは、生涯の 1 回限りの購入オプションを提供しており、私の経験では、その価格は 100 ドルから 300 ドル程度までになる傾向があります。2008年当時のほとんどのアプリよりもはるかに高額です。

## [Reminder: Conditional Breakpoints are Slow](https://twocentstudios.com/2024/08/08/conditional-breakpoints/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20673)
- TBD

## [Swift Navigation: Powerful navigation tools for all Swift platforms](https://www.pointfree.co/blog/posts/149-swift-navigation-powerful-navigation-tools-for-all-swift-platforms?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20673)

- point-freeの新しいライブラリ
    - [Swift Navigation](https://github.com/pointfreeco/swift-navigation)
- 下記のような状態管理ViewModelがある場合…

```swift
@Observable
class FeatureModel {
  var destination: Destination?

  enum Destination {
    case addItem(AddItemModel)
    case deleteItemAlert
    case editItem(EditItemModel)
  }
}
```

- 下記のようにdot-chainで書けるようになる

```swift
+@CasePathable
 enum Destination {
   …
 }

.sheet(item: $model.destination.addItem) { addItemModel in
  AddItemView(model: addItemModel)
}
.alert(
  "Delete?",
  isPresented: Binding($model.destination.deleteItemAlert)
) {
  Button("Yes", role: .destructive) { … }
  Button("No", role: .cancel) {}
}
.navigationDestination(
  item: $model.destination.editItem
) { editItemModel in
  EditItemView(model: editItemModel)
}
```

- これ以外にも色々できて便利そう(学習コストは勿論ある)

## [Embedded Swift Tutorial \- Getting Started \(Everything you need to know\)](https://blog.supereasyapps.com/embedded-swift-tutorial-getting-started-everything-you-need-to-know/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20673)

- WWDC2024でEmbedded Swiftが発表された。その使い方

## [How to automatically detect memory leaks on CI/CD using UI tests](https://www.polpiella.dev/automatically-detect-memory-leaks-using-ui-tests/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20673)
- WWDC2021でxcodebuildでXCTMemoryMetricsに失敗するたびに、メモリグラフを作成する新しいオプションが追加された
    - [Detect and diagnose memory issues](https://developer.apple.com/videos/play/wwdc2021/10180/)
- これは`enablePerformanceTestsDiagnostics`フラグだが、Xcodeでは利用不可
- これを使ってCI/CD上でメモリリークグラフを検出できる
- メモリ使用量のテストはXcodeでも利用できる
    - [XCTMemoryMetric](https://developer.apple.com/documentation/xctest/xctmemorymetric)


## [iOSDevLibrary](https://iosdevlibrary.lemonsqueezy.com/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20673)

>Frank Thamel は 2 冊の本を出版しています。1 冊は無料で、もう 1 冊は有料です。1 冊目の「Crafting Consistency: Building a Complete App Design System with SwiftUI」は、名前から想像するよりもコードに重点が置かれていますが、SwiftUI アプリの見栄えを良くするために必要な知識の多くをカバーしています。アクセシビリティに関する章が 1 つ欠けていますが、そのテーマについては別の本が丸々 1 冊あるので問題ありません。その本は無料です。👍
