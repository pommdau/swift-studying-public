# [iOS Dev Weekly - Issue 675](https://iosdevweekly.com/issues/675)

## [How to use EditorConfig files in Xcode](https://www.polpiella.dev/xcode-editor-config/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20675)
- Xcode16からEditorConfigがサポートされ、プロジェクトごとにエディタの設定ができるようになった
- `.xcodeproj`または`Package.swift`と同じディレクトリに下記を作成
- 作成後Xcodeを再起動すると設定が効くようになった

![](https://i.imgur.com/hxzh6rD.jpeg)

- ファイル名: `.editorconfig`

```toml
[*.swift]
indent_style = space
indent_size = 4
tab_width = 4
end_of_line = crlf
insert_final_newline = false
max_line_length = 120
trim_trailing_whitespace = true
```

## [Quickly move between changes in a file in Xcode with this keyboard shortcut](https://www.neilmacy.co.uk/blog/keyboard-shortcut-next-change?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20675)
- Git履歴が追えるショートカット

>CTRL-\ lets you move quickly to the next change in a file, tracking git changes.

- メルマガ内の下記のショートカットが便利そう

>私は ⌘+\ (現在の行にブレークポイントを作成) をいつも使用しているため

## [SwiftTranslate](https://swiftpackageindex.com/hidden-spectrum/swift-translate?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20675)
- String Catalogsを翻訳するための無料ツール
- ChatGPTを利用している

## [Typed throws in Swift](https://swiftwithmajid.com/2024/08/20/typed-throws-in-swift/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20675)
- 従来の書き方

```swift
enum FooError: Error {
    case tooBig
    case tooSmall
}

func foo() throws -> Int {
    let value = Int.random(in: 1...100)
    
    guard value < 60 else {
        throw FooError.tooBig
    }
    
    guard value > 20 else {
        throw FooError.tooSmall
    }
    
    return value
}

func boo() {
    do {
        let value = try foo()
        print(value)
    } catch let error as FooError {
        switch error {
        case .tooBig: print("Too big...")
        case .tooSmall: print("Too small...")
        }
    } catch {
        print("General erro: \(error)")
    }
}
```

- errorの型変換が不要になり、エラーハンドリングが楽になっている

```swift
enum FooError: Error {
    case tooBig
    case tooSmall
}

func foo() throws(FooError) -> Int {
    let value = Int.random(in: 1...100)
    
    guard value < 60 else {
        throw .tooBig
    }
    
    guard value > 20 else {
        throw .tooSmall
    }
    
    return value
}

// エラーハンドリング

func boo() {
    do {
        let value = try foo()
        print(value)
    } catch {
        switch error {
        case .tooBig: print("Too big...")
        case .tooSmall: print("Too small...")
        }
    }
}    
```

- 以前との互換性の話も面白い

![](https://i.imgur.com/MngkaRb.jpeg)

## [SwiftUI for Mac 2024](https://troz.net/post/2024/swiftui-mac-2024/)

- WWDC2024で色々追加されているやつを実践してみた感じっぽい。
    - [\[WWDC24\] SwiftUIの新機能のまとめ](https://spinners.work/posts/wwdc24-whats-new-in-swiftui/)

>過去 2 年間の Xcode のマイナー アップデートで、私が気に入っている機能は、Control-M を使用して長いコード行を複数行に分割することです。

- ウインドウの中央配置

```swift
.defaultWindowPlacement { content, context in
  let displayBounds = context.defaultDisplay.bounds
  let contentSize = content.sizeThatFits(.unspecified)
  let position = CGPoint(
    x: displayBounds.midX - (contentSize.width / 2),
    y: displayBounds.midY - (contentSize.height / 2)
  )
  return WindowPlacement(position, size: contentSize)
}
// ウインドウの情報を記憶しない(毎回中央に表示するため)
.restorationBehavior(.disabled)
```

- Tabの書き方がより直感的に。

![](https://i.imgur.com/mLudvHK.jpeg)


    

## [Indie Diary \#8 — Giving watchOS the love it deserves](https://blog.thomasdurand.fr/story/2024-08-15-indie-diary-8/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20675)

- watchOSは基本的にリリースから変わっていないが、watchOS10で結構改善されたという話
- 色が付けられるようになった

![](https://i.imgur.com/84trOLf.jpeg)
- セクションが区切れるように

![](https://i.imgur.com/x86PswZ.jpeg)
