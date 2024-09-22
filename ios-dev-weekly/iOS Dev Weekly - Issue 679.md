# [iOS Dev Weekly - Issue 679]()
## [Announcing Swift 6](https://www.swift.org/blog/announcing-swift-6/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20679)
- Swift6の話
- Concurrency
    - 移行の話を詳しくは[Migrating to Swift 6](https://www.swift.org/migration/documentation/migrationguide/)
    - rowLevelなAPIも用意されている。[Synchronization](https://developer.apple.com/documentation/synchronization)
- Typed Throw
    - Genericを使ってエラーを伝播させることもできる

```swift
extension Sequence {
  func map<T, E>(_ body: (Element) throws(E) -> T) throws(E) -> [T] { 
    // ... 
  }
}
```

- Ownership
- Swift5.9で追加された`~Copyable`
    - [Swift ~Copyableの導入](https://tech.every.tv/entry/2024/08/27/164253)
    - [Swiftでのコピー不可な型の使用](https://developer.apple.com/jp/videos/play/wwdc2024/10170/)
- コピー可否の両方の型のジェネリックが書けるようになった

```swift
func drink(item: consuming some Drinkable & ~Copyable) {
  item.use()
}
```

- 128bitの整数`UInt128`と`Int128`の導入
- `@DebugDescription`の導入
- SwiftTesting、Swift6のツールチェーンに含まれるのでimportや依存関係が不要

## [swift\-export](https://swiftpackageindex.com/franklefebvre/swift-export?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20679)
- リリースの自動化、pkgインストーラの作成補助として良さそう

>macOS 用の署名済みおよび公証済みのインストーラー パッケージを生成するために使用されるコマンドライン ツールです。生成されたインストーラー パッケージには、任意の実行可能ファイル (Swift Package Manager プロジェクトからビルド) と、LaunchDaemons plist ファイルなどのオプションのペイロードを含めることができます。

## [Xcode Folders & Groups](https://troz.net/post/2024/xcode_folders_groups/)
- グループがフォルダになった
- Appleがフォルダがデフォルトとして良いと判断したのだから、それに従うのが良い
- デフォルトから外れると、他人を混乱させてしまうから

![image](https://i.imgur.com/s6WwKWd.png)

## [Example of a Cross\-Platform macOS/Windows Application Developed Using Swift 6](https://forums.swift.org/t/example-of-a-cross-platform-macos-windows-application-developed-using-swift-6/74591/1)

>Fellmonger は、 macOSとWindowsプラットフォームの両方と互換性のある、Swift 6 を使用して開発されたネイティブ デスクトップ アプリケーションを紹介するサンプル プロジェクトです。

## [MoveMe \- SwiftUI Edition](https://whackylabs.com/swift/swiftui/ios/animation/2024/09/12/moveme-swiftui-edition/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20679)

- Step-by-stepで実装するSwiftUIのジェスチャアニメーション

## [Previews in Xcode Playgrounds](https://www.neilmacy.co.uk/blog/xcode-playgrounds-previews?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20679)

- Xcode Playgroundsでプレビューができるという話
- 合う合わないはあるかもしれないが選択肢として

## [Discovering Camera Control](https://www.createwithswift.com/discovering-camera-control/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20679)
- カメラボタンのUIやインタラクションのデザインについて
- ダイナミックアイランドのようなハードとソフトの融合を感じる

>ユーザーがカメラ コントロールを軽く押すと、オーバーレイが表示されます。1 回押すとスライダーが開き、2 回押すと追加のコントロールが表示されます。これらのコントロールを使用すると、ユーザーは設定を即座に調整できます。

![image](https://i.imgur.com/gOTYFQM.png)

## [Some neat ones include HIGs for Mac OS 8 & a preliminary Mac OS X version from the Public Beta\.](https://mastodon.social/@marioguzman/112751817896831142)
- HIGのアーカイブ
- (権利関係怪しそうな気はする)
