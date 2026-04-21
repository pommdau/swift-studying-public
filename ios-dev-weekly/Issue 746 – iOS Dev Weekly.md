## [Issue 746 – iOS Dev Weekly](https://iosdevweekly.com/issues/746/)
## [Swift 6.3 Released | Swift.org](https://www.swift.org/blog/swift-6.3-released/)
- Swift 6.3の変更
- モジュール名を指定して呼び出せるようになった

```swift
import ModuleA
import ModuleB

let x = ModuleA::getValue() // Call 'getValue' from ModuleA
let y = ModuleB::getValue() // Call 'getValue' from ModuleB
```

- その他SwiftTestingやDocCの改善などが関係ありそう

## [brrr](https://brrr.now/)
- 通知を送るだけのアプリ
- 登録不要でシンプルさが良い

## [Expanding Animations in SwiftUI Lists | Pavel Zak’s dev blog](https://nerdyak.tech/development/2026/03/16/expand-animation-in-SwiftUI-List.html)
- リスト開閉アニメーション。`DisclosureGroup`があるがカスタムしたい場合に。
- でも基本は`DisclosureGroup`で良い気がする。

## [Talking Liquid Glass with Apple - by Danny Bolella](https://captainswiftui.substack.com/p/talking-liquid-glass-with-apple)

- AppleオフィスでLiquid Glassについて質問してみた
- フラットデザインに戻るんじゃない？
    - NO.とりあえず動くような最低限の対応で済ましている場合は、後々負債になるだろう。受け入れましょう
- コンテンツとコントロールの2層を厳密に分けよう
    - ユーザにとってコンテンツが全て。コントロールはコンテンツを邪魔せず、インタラクションを容易にするものである
    - (Liquid Glassで視覚的に希薄化させる、ということだろうか)
- Liquid Glassのカスタム要素が不足している問題
    - 認識している。今はv1.0で安定性重視だったが、これからに期待して。
- その他の普遍的なアドバイス
- ListやScrollViewをデフォルトで満足しない
    - 非常に特定の均一なデータ構造やスワイプ操作が絶対に必要な場合はOK
    - ただしScrollView/LazyStackの柔軟性とパフォーマンス向上により、独自のレイアウトを作成してスタイリングすることができる。
    - またこれはLiquid Glassのデザインにも役立つだろう
- Custom Containersを使う
    - modifierを12個つけるのではなく、それ用のmodifierを作成してコードをスッキリさせよう、くらいのことだろうか
- Liquid Glassなどデザインが一新された今、ネイティブコンポーネントにこだわるのが最善。カスタムシェイプで独自に実装していると時代遅れになる。

## [Testing the Swift C compatibility with Raylib | A journey into a wild pointer](https://carette.xyz/posts/swift_c_compatibility_with_raylib/)
- C言語をSwiftでラップするのは非常に簡単？な話

## [The SwiftUI Way](https://books.nilcoalescing.com/the-swiftui-way)
- 元Appleの人が書いていて、サンプル見る限り結構良さそう

## [Apple、Mac Proの販売を終了、今後のハードウェア展開はなし - 9to5Mac](https://9to5mac.com/2026/03/26/apple-discontinues-the-mac-pro/)
- Mac Proは終了(´；ω；｀) 
- mac studioが乗り換え候補？
