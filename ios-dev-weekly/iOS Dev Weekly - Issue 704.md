# [iOS Dev Weekly - Issue 704](https://iosdevweekly.com/issues/704/)

## コメント
- 改行を調整して各行の幅をほぼ同じ長さにするための小さなパッケージ
- [kylebshr/AestheticText: do it for the ✨aesthetic✨](https://github.com/kylebshr/AestheticText)
- UIKit, SwiftUIをインポートしているライブラリは、しばらくアップデートされなくなると使えなくなる危険性があるという意見がある
- こういうUIのライブラリはより参照しているアプリのコードの基礎になり、ライブラリの依存度が高い
- そのためパッケージをインポートする際、削除したときの影響を考慮するといい。
- 今回のものでいうと削除した場合はアプリの洗練性が落ちるがその他の副作用はないので問題ないだろう。

![](https://i.imgur.com/fEQ6GYM.jpeg)

## [Choosing Optimism about iOS 19 - David Smith, Independent iOS Developer](https://david-smith.org/blog/2025/03/17/optimism/)

- WWDC2025でUIが大幅に刷新されるという噂
- 否定的な意見も多いが楽観的になろう。盲目的ではなく現実的に良い点を追求することで。
    - いち早く追従することで他のアプリとの差別化になる
    - 新しいのものに取り組むのは楽しい。VisionOSとかね。iOSでもそのプロセスをもう一度経験して新しい方法でアプリを美しくするという作業を行える
    - 私には全体像が見えないが、Appleには次世代のプラットフォームが見えていて、発表された情報の行間をみることでどこへいこうとしているかの手かがりが得られる

>ポジティブな結果に焦点を当てることで、私は自分の反応にずっとバランスが取れたと感じ、より希望に満ちた成長に基づいた視点で、挑戦的な仕事になる可能性のある夏に目を向けることができるようになったと思います。
>私は、今 Apple やその発表に対して誰もが否定的な感情を抱くべきではないと言っているわけではありませんが、これは単に私の精神衛生を維持し、自分の選んだ専門分野で最高の仕事を続けられるようにするために私が培っている実践/アプローチです。

## [Swift + Zed = ❤️. Swift engineering workflow inside Zed… | by Tornike Gomareli | Mar, 2025 | Medium](https://tgomareli.medium.com/swift-zed-%EF%B8%8F-6b08de865425)

- VSCodeに対応しようとするLLMを備えたテキストエディタのZed
- すぐに触らなくてもよさそう。今後に期待。

## [Screenshot Studio](https://appstorescreenshotstudio.com/)

- 欲しい機能が全部詰まったスクリーンショットのツール

## [Not all AI-assisted programming is vibe coding (but vibe coding rocks)](https://simonwillison.net/2025/Mar/19/vibe-coding/)

- `Vibe Coding`が注目されている
- LLMをつかって、コードを意識せずにすべてをLLMに任せる手法
    - 提案は常に承認、差分も見ない
    - エラーがでたらコメントをそのまま貼り付ける、通常はこれで解決する
    - LLMが修正できない場合もあるので、回避するかバグがなくなるまでランダムな変更を依頼する
    - 週末の使い捨てのプロジェクトとしては面白い
- Vibe Codingは経験豊富な開発者がLLMのできることできないこと、を直感的に理解するのに最高のツールである
- 勿論これを通常のコードとLLMの用途と混合しないでね

## [Why I Avoid Group — Chris Eidhof](https://chris.eidhof.nl/post/why-i-avoid-group/)

- 下記のコードだとPreviewとSimulatorの動きが異なる(Simulatorの動きがバグである)

```swift
Group {
    Text("One")
    Text("Two")
}
.padding()
.background(.blue)
```

![](https://i.imgur.com/qDVbPop.jpeg)

- 問題の原因は上記のGroupが実際には２つのビューを返すためかもしれない
- 解決方法としてはVStack/ZStackを使うこと。(HStackは感覚的に間違っているように感じるので筆者は使っていない)
- ※将来的にはこれらのバグは解決するだろう

>Note: all of this is tested with iOS 18.2, hopefully some of this will be fixed in the future.


```swift
VStack {
    if let image {
        Image(image)
    } else {
        Text("Loading…")
    }
}
.onAppear {  } /* works */
```

## [(35) Swift Heroes 2024 - YouTube](https://www.youtube.com/playlist?list=PLfCiO1zYKkATN7rOAaU1lyNEWJ3sXeKXx)

- カンファレンスの動画アーカイブ
