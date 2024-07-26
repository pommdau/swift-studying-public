# [iOS Dev Weekly - Issue 667](https://iosdevweekly.com/issues/667)

# What's new in SwiftUI for iOS 18

- 記事と紹介されているリンクを一通り眺めた。Viewが@MainActorになることで既存コードに影響もありそう。
- MainActorについて怪しかったので以下で補完。
- https://qiita.com/temoki/items/582fc15697d71f931c8e
- 下記も参考になりそう- 
  - [【翻訳】@MainActor and Global Actors in Swift](https://zenn.dev/yuki216/articles/d1f07f1cae5283)
  - [SwiftUI ビューと@MainActor](https://zenn.dev/fatbobman/articles/ee06ac589e05a9)

- How to create zoom animations between views
  - id指定でHeroと同じような使い勝手？試したい。
- How to use @State inside SwiftUI previews using @Previewable
  - Xでも言われてたすぐに導入できるやつ
- The @Entry macro makes it much easier to create and use custom environment values
  - Environmentが簡単に扱えるやつ
- How to lets users drag anywhere to move a window
  - 多分AppKitであった背景をドラッグできるようになるものと同じ

>Second, working with the keychain remains incredibly hard. This API has always been problematic, but by ignoring it SwiftUI makes the problem worse – it's trivial to use @AppStorage, but doing so sacrifices essential user security. Sadly, we're in a state where the wrong choice is by far the easiest to reach for.

- AppStorageと同等の実装でKeyChainをかけるWrapperを作っている例がいくつもあるが、今のスタンダードはなんだろうか…(調べてもちょっと分からず)

# Mixing colors in SwiftUI

- やれることが動画で一目。Colorの話題だとmesh gradientのほうが興味がある。(先の項目の How to create a mesh gradient)

# Free, on-device translations with the Swift Translation API

- 翻訳APIについてとても良くまとまっている。速度もよさそう。
- 用意されているUIもあればAPIとしても利用できる。