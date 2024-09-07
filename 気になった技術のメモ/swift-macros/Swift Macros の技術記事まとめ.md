# Swift Macros の技術記事

- [krzysztofzablocki/Swift\-Macros](https://github.com/krzysztofzablocki/Swift-Macros?tab=readme-ov-file)
  - 必要な資料がまとまっている

## WWDC

- [Expand on Swift macros\.md](https://github.com/pommdau/swift-studying-public/blob/main/wwdc2023/Expand%20on%20Swift%20macros.md)
- [Write Swift macros\.md](https://github.com/pommdau/swift-studying-public/blob/main/wwdc2023/Write%20Swift%20macros.md)

## 岸川さん

- [Mastering SwiftSyntax by kishikawa katsumi](https://fortee.jp/iosdc-japan-2023/proposal/da53c5df-a243-46b1-a3e2-c35dd9fdda11)
  - WWDC のように非常に分かりやすい。探索周りが理解できていないので要復習
  - [kishikawakatsumi/iosdc\-2023\-samples](https://github.com/kishikawakatsumi/iosdc-2023-samples)
- [Swift AST Explorer](https://swift-ast-explorer.com/)

  - 言わずとしれた岸川さんの便利ツール。
  - 解析は Xcode の`po`でもいけるけれど、Syntax を作るときの構造を調べるときにとても重宝する

## 技術記事

- [SwiftLangJp: マクロ\(Macros\)](https://www.swiftlangjp.com/language-guide/macros.html#%E3%83%9E%E3%82%AF%E3%83%AD%E3%81%AE%E5%AE%9F%E8%A3%85)
  - `init`から実装まで
- [Swift Macros の作り方](https://buildersbox.corp-sansan.com/entry/2024/03/13/110000)
  - 基本的な使い方の記事
    [個人開発アプリでの Swift Macros 紹介](https://speakerdeck.com/swiftty/ge-ren-kai-fa-ahuriteno-swift-macros-shao-jie)
  - 具体的な Syntax の使い方が参考になる

![image](https://i.imgur.com/EujMrln.png)

- [カスタム Swift Macro マクロの作成 \(例：SF Symbol / URL バリデータ / iCloud キーバリューストアバインド\)](https://qiita.com/mashunzhe/items/40a5b1270c514606adcc)
- [Swift 5 で String Interpolation をカスタマイズする](https://qiita.com/mishimay/items/b4503b00134c26fb8f53)

```swift
return "(\(argument), \(literal: argument.description))"
```

- https://www.avanderlee.com/swift/swiftsyntax-parse-and-generate-swift-source-code/
  - 分かりやすい

## 技術記事(積読)

- [swift\-syntax を用いて、簡単なコマンドラインツールを作ってみる](https://zenn.dev/oks/articles/2dcd28a22d4ba6)
- [swift\-syntax に入門してみた](https://qiita.com/fuziki/items/9869ab54ba95e9fc3c3a#buildtoolplugin-%E3%82%92%E4%BD%9C%E6%88%90%E3%81%97%E3%81%A6%E3%81%BF%E3%81%9F)

## Swift Macros の実装例

- [CuriositySoftware/swift\-property\-name](https://github.com/CuriositySoftware/swift-property-name)
  - Syntax の組み立て方参考になりそう
  - https://github.com/CuriositySoftware/swift-property-name/blob/main/Sources/Implementation/Macro/PropertyNameMacro.swift
- [p\-x9/ObfuscateMacro](https://github.com/p-x9/ObfuscateMacro)
  - コード中の文字列を難読化する。`@freestanding`マクロの好例
- [Now in REALITY Tech \#92 Swift マクロを活用したログ API について](https://note.com/reality_eng/n/n913ce7ded7d5)
