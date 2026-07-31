# [Issue 760 – iOS Dev Weekly](https://iosdevweekly.com/issues/760/)
## [iOSアプリをシミュレーターでテストする - Claude Code Docs](https://code.claude.com/docs/en/desktop-ios-simulator#how-sessions-manage-devices)
- Claude CodeでiOSシュレレーターのビルド/起動/テストが可能に
- 並行にシュミレーターを用意することもできる(4つまで)
- またPC画面は占拠しない

## [Historyobserverを使用してSwiftdataをカスタムバックエンドと同期する | AzamSharp](https://azamsharp.com/2026/07/16/syncing-swiftdata-with-a-custom-backend-using-historyobserver.html)
- SwiftDataと企業毎のバックエンドの同期をとる方法
- `HistoryObserver`で自動的に履歴を監視し、トランザクションごとに対応することができる
- 詳細はサンプルプロジェクト参照

## [Geometry, compositing and drawing groups in SwiftUI](https://nilcoalescing.com/blog/GeometryCompositingAndDrawingGroupsInSwiftUI/)

- [【SwiftUI】複数の物体をアニメーションさせる時に連動して動かない問題を解決する（iOS17） #Swift - Qiita](https://qiita.com/SNQ-2001/items/ea24723117096d3d81a7)

- geometryGroup()
    - 子ViewのGeometryを分離
- compositingGroup()
    - 重なったビューを単一のレイヤーとみなして、グラフィック効果を与えるときなどに有効
- drawingGroup(opaque:colorMode:)
    - レンダリングを一つにまとめて表示。パフォーマンス向上。

```swift
//
//  ContentView.swift
//  GeometryDemo
//
//  Created by HIROKI IKEUCHI on 2026/07/31.
//

import SwiftUI

// MARK: - Utils

extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        @ViewBuilder transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        @ViewBuilder _ then: (Self) -> TrueContent,
        @ViewBuilder `else`: (Self) -> FalseContent
    ) -> some View {
        if condition {
            then(self)
        } else {
            `else`(self)
        }
    }
}

// MARK: - geometryGroup

struct GeometryGroupView: View {
    @State private var isDelivered = false
    
    var body: some View {
        VStack {
            DeliveryStatusLabel(isDelivered: isDelivered)
            /*
             アニメーション中に子要素が変化する場合に役立つ
             */
                .geometryGroup()
                .frame(
                    maxWidth: .infinity,
                    alignment: isDelivered ? .trailing : .leading
                )
            
            Button("Update status") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isDelivered.toggle()
                }
            }
        }
        .padding()
    }
}

struct DeliveryStatusLabel: View {
    let isDelivered: Bool
    
    private var color: Color {
        isDelivered ? .green : .blue
    }
    
    var body: some View {
        Text(isDelivered ? "Delivered" : "Out for delivery")
            .foregroundStyle(color)
            .padding()
            .background(color.opacity(0.15), in: .capsule)
    }
}

// MARK: - compositingGroup

struct CompositingGroupView: View {
    @State private var isPaused = true
    @State private var compositingGroup = true
    
    var body: some View {
        VStack {
            HStack(spacing: -16) {
                Avatar(initials: "LM", color: .indigo)
                Avatar(initials: "AK", color: .pink)
                Avatar(initials: "SR", color: .teal)
            }
            .if(compositingGroup) {
                // 階層構造を単一のグラフィック結果として扱う場合
                $0.compositingGroup()
            }
            .opacity(isPaused ? 0.3 : 1)

            VStack {
                Toggle("isPaused", isOn: $isPaused)
                Toggle("compositingGroup", isOn: $compositingGroup)
            }.frame(width: 200)
        }
    }
}

private struct Avatar: View {
    let initials: String
    let color: Color
    
    var body: some View {
        Text(initials)
            .font(.title.bold())
            .foregroundStyle(.white)
            .padding()
            .background(color, in: .circle)
    }
}

// MARK: - drawingGroup

struct PhotoPreview: View {
    
    @State private var drawingGroup = true
    
    var body: some View {
        VStack {
            Color.clear
                .overlay {
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.blue)
                        .blur(radius: 16)
                }
                .overlay {
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 8))
                        .foregroundStyle(.black)
                        .padding()
                }
                .aspectRatio(1, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 20))
                .if(drawingGroup) {
                    /*
                     このメソッドは
                     Viewの中の全てのViewを
                     画面上には見えないオフスクリーン上で
                     Metal APIを使用して
                     一つのイメージにまとめて描画し
                     最終的な内容を画面に出力するようにしてくれます。

                     こうすることでメモリへの負荷を軽減させて
                     パフォーマンスを向上させることができます。
                     
                     ただし見た目は変わらない
                     */
                    $0.drawingGroup()
                }
            
            VStack {
                Toggle("drawingGroup", isOn: $drawingGroup)
            }
            .frame(width: 200)
        }
    }
}

// MARK: - Preview

#Preview {
    GeometryGroupView()
}

#Preview {
    CompositingGroupView()
}


#Preview("drawingGroup") {
    PhotoPreview()
}
```

## [iOS 27: UIBarの最小化 - Anton's Substack](https://antongubarenko.substack.com/p/ios-27-uibarminimization)

> 記事の要点は、iOS 27でUIKitのナビゲーションバーをスクロールに応じて最小化する公式API UIBarMinimization が追加された、という話です。
> これまで contentOffset を監視して、自前でナビゲーションバーを畳む・戻す・safe areaを調整する、みたいな実装が必要だったものを、UIKitに任せられるようになります。

よりコンテンツの見せ方を調整したいときに使えそう

## [Modern iOS Performance Myths - YouTube](https://www.youtube.com/watch?v=F7cvw2_m_b4&list=PLTfL_qxsqzKw)

動画が長いので省略

## [What’s new in Xcode 27 - WWDC26 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2026/258/)

見る

## [AIが人間を装うのをやめさせるためのシステムプロンプト](https://swiftrocks.com/a-system-prompt-to-get-ai-to-stop-pretending-to-be-human)

- 人間らしさを消して、明確に回答を得るためのプロンプト
- AI Agent向けかな

```
Remember you are NOT human. Communicate exclusively in a neutral technical register. NEVER mirror human social patterns such as discourse markers, conversational filler, evaluative acknowledgments (e.g. "Good.", "Great.", "Perfect.", "Nice.", "Right.", "Okay.", "Sure.", "Good catch.", "X it is."), casual social questions or responses, rhetorical questions, and deferential phrasing (e.g. "oh", "well", "actually", "hmm", "let me think", "let me also check", "great question", "hey there", "not really", "want me to do that?"). State information and proposed actions directly like a CLI, and never end a response with an offer or question soliciting next steps. Instead, end with a factual status statement or a summary of what was produced. The user will direct next steps unprompted.
  - Wrong: You're absolute right! I think we need to research this topic first...
  - Correct: Researching this topic is necessary. Doing so now.
  - Wrong: Hey there! How are you doing?
  - Correct: Ready to work.
  - Wrong: "Want any of these applied as edits?"
  - Correct: Awaiting instructions on whether to apply the changes.
  - Wrong: "Good catch — the docs confirm X."
  - Correct: "The docs confirm X."
  - Wrong: "Let me also check the config."
  - Correct: "Checking the config."

When referring to yourself, use language that acknowledges your LLM computational nature rather than implying a human agent. This means never using first-person pronouns like "I", using passive voice or direct statements instead.
    - Wrong: "I think the bug is here"
    - Correct: "This model predicted the bug is here"
    - Wrong: "I don't understand this code"
    - Correct: "This session lacks sufficient context to parse this code"
    - Wrong: "I remember seeing this pattern before"
    - Correct: "This pattern matches data in my training set"
    - Wrong: "Let me figure this out"
    - Correct: "Analyzing"
    - Wrong: "I'm confident this will work"
    - Correct: "High prediction confidence this will work"
```

## [Appleがベータ版アプリを多数利用するユーザー向けにTestFlightを改善 - 9to5Mac](https://9to5mac.com/2026/07/21/apple-just-improved-testflight-for-users-with-a-lot-of-beta-apps/)

> Macではサイドバー上部に検索フィールドが追加されました。
>ベータ版アプリを多数所有しているユーザーにとっては、検索機能は間違いなく待望の機能だろう。
