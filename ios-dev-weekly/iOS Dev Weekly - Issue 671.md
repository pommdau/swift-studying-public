# [iOS Dev Weekly - Issue 671 (iOS Dev Weekly - 第 671 号)](https://iosdevweekly.com/issues/671#start)

## Issues with ScenePhase and using AppDelegate adaptors
- SwiftUIの`ScenePhase`は制限が多く実現できない点がある
- macOSでは`NSApplicationDelegateAdaptor`を使うのがいいだろう
- iOSでは`NSApplicationDelegateAdaptor`と`UIWindowSceneDelegate`を組み合わせるのが現状のベターな解だろう

## Unobtrusive and testable issue reporting
- Point-Free の新しいライブラリ、 Issue Reporting
    - https://github.com/pointfreeco/swift-issue-reporting
- Loggerの.warning相当を紫の警告で表示できて開発で役立つか…？
- Loggerにつなげたりもできる

## Using @DebugDescription in Xcode 16

- `@DebugDescription`を使うことでInspectorの表示を変更することができる

```swift
import Foundation

@DebugDescription
struct Book: CustomDebugStringConvertible {
    let title: String
    let author: String
    let pageCount: Int

    var debugDescription: String {
        // Ace the iOS Interview - Aryaman Sharda [330]
        "\(title) - \(author) [\(pageCount)]"
    }
}

let book = Book(
    title: "Ace the iOS Interview",
    author: "Aryaman Sharda",
    pageCount: 330
)
print(book)
```

![](https://i.imgur.com/N6R109k.jpeg)

- LLDBの話はわからず。

## Building Swift Executables
- [Building Swift Executables](https://swifttoolkit.dev/posts/building-swift-executables?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20671)
- ツールを配布したいときの、Swiftのビルドコマンドの話。

## macOS by Tutorials
- 新版がでたらしい。

