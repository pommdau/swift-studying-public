# [iOS Dev Weekly - Issue 703.md](https://iosdevweekly.com/issues/703/)

## Comment
- RevenueCatから学べることは多い
- ブログやポッドキャスト、ニュースレターを提供していて質が高い
- アプリ開発者であれば彼らのマーケティング手法を見て学べる事があると思う
- ブログを通してRevenueCatを使ってもらったり、会社への信用度を高める手法は参考になる、みたいなことだろうか

## [Brazilian court gives Apple 90 days to allow sideloading on iOS](https://9to5mac.com/2025/03/06/brazilian-court-apple-sideloading-ios/)

- EUに続いてブラジルの裁判所もiOSのサイトローディングを90日以内に許可するように命じた
- Appleとしてはユーザのプライバシーとセキュリティを損なうとして控訴するとのこと

>サイドローディング（Sideloading）とは、正規のアプリストアなどを経由せずに、スマートフォンやタブレットなどのモバイル端末にアプリやファイルをインストールする行為です。﻿

## [Framous: Screenshot Frames on the Mac App Store](https://apps.apple.com/us/app/framous-screenshot-frames/id6636520519?mt=12)

- スクリーンショットにフレームを付けるためのツール
- 無料でもある程度できるそうで評価も高い

## [Placing UI components within the Safe Area Inset](https://www.createwithswift.com/placing-ui-components-within-the-safe-area-inset/)

- `safeAreaPadding`で下記の通りコンテンツの位置を調整できる

![](https://i.imgur.com/gP7wioV.jpeg)

- また下記でセーフエリアにUIを配置できる
    - [safeAreaInset(edge:alignment:spacing:content:) | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/view/safeareainset%28edge:alignment:spacing:content:%29-4s51l?ref=createwithswift.com)

<details>
<summary>コード全体</summary>

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Safe Area Insets Example")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .safeAreaPadding(.top, 64.0)
        
        .safeAreaInset(edge: .top, spacing: 0) {
            safeAreaComponent(text: "Top Bar", symbolName: "globe")
        }
        
        .safeAreaInset(edge: .bottom, spacing: 0) {
            safeAreaComponent(text: "Bottom Bar", symbolName: "star.fill")
        }
    }
    
    func safeAreaComponent(text: String, symbolName: String) -> some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
            Image(systemName: symbol)
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.3))
    }
}
```

</details>

## [Understanding structural identity in SwiftUI](https://tanaschita.com/swiftui-structural-identity/)
- SwiftUIのViewは、プロパティで変更された部分のみ再描画される
- ViewのIdentifierを意識するといい
    - [[SwiftUI] ViewのIdentityと再描画を意識しよう](https://zenn.dev/kntk/articles/1f1b40da6fe181)
- Listもこの意味でid/Identifiableで一意に指定することが大事。データベースのIDなどがいい


```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ExampleView()
    }
}

struct ExampleView: View {
    
    @State private var isOn = true

    var body: some View {
        let _ = print("Redraw: ExampleView")
        
        VStack {
            Text("Is on: \(isOn ? "yes": "no")")
            Button("Switch") {
                isOn.toggle()
            }
            
            // isOnが変わるたびに初期化される
            if (isOn) {
                BottomView(text: "On1", color: .blue)
            } else {
                BottomView(text: "Off1", color: .green)
            }
            
            // isOnが変わっても初期化されず保持
            ZStack {
                BottomView(text: "On2", color: .blue)
                    .opacity(isOn ? 1 : 0)
                    .accessibilityHidden(!isOn)
                BottomView(text: "Off2", color: .green)
                    .opacity(isOn ? 0 : 1)
                    .accessibilityHidden(isOn)
            }
        }
    }
}

struct BottomView: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        let _ = print("Redraw: \(text)")
        ZStack {
            color
            Text(text)
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}

```

## [Rendering Pixel Art with SwiftUI](https://twocentstudios.com/2025/03/10/pixel-art-swift-ui/)

- Canvasのいい練習になる

![](https://i.imgur.com/27LlV6U.jpeg)
<details>
<summary>コードまとめ</summary>

```swift
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    var body: some View {
//        NativeImageView()
//        BitmapImageView()
        Text("hoge")
    }
}

// MARK: - Model

struct Bitmap: Equatable, Sendable {
    // Access via `values[row][column]`
    var values: [[Color]]

    var rows: Int { values.count }
    var columns: Int { values.first?.count ?? 0 }
    var aspectRatio: CGFloat { CGFloat(columns) / CGFloat(rows) }
}

extension Bitmap {
    init(_ initialColor: Color? = nil, rows: Int, columns: Int) {
        values = .init(repeating: .init(repeating: initialColor ?? .white, count: columns), count: rows)
    }
    
    mutating func fill(_ color: Color) {
        values = .init(repeating: .init(repeating: color, count: columns), count: rows)
    }
    
    static func mockGrid(rows: Int, columns: Int) -> Self {
        var instance = Self(rows: rows, columns: columns)
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                instance.values[row][column] = row % 2 == column % 2 ? .black : .white
            }
        }
        return instance
    }
    
    static func mockRowColors(rows: Int, columns: Int) -> Self {
        var instance = Self(rows: rows, columns: columns)
        for row in 0 ..< rows {
            instance.values[row] = Array(
                repeating: .init(
                    hue: Double(row) / Double(rows),
                    saturation: 0.7,
                    brightness: 1.0
                ),
                count: columns
            )
        }
        return instance
    }
}


// MARK: - Views

struct NativeImageView: View {
    var body: some View {
        Image("color-image-10-10") // 10x10 PNG in Assets.xcassets
//            .interpolation(.none)
//            .interpolation(.high)
            .resizable()
            .scaledToFit()
    }
}

struct BitmapImageView: View {
    let bitmap: Bitmap

    var body: some View {
        Image(
            size: .init(width: bitmap.columns, height: bitmap.rows),
            label: nil,
            opaque: true,
            colorMode: .nonLinear
        ) { ctx in
            let cellWidth: CGFloat = 1
            let cellHeight: CGFloat = 1
            for row in 0 ..< bitmap.rows {
                for column in 0 ..< bitmap.columns {
                    let path = Path(
                        CGRect(
                            x: CGFloat(column) * cellWidth,
                            y: CGFloat(row) * cellHeight,
                            width: cellWidth,
                            height: cellHeight
                        )
                    )
                    ctx.fill(path, with: .color(bitmap.values[row][column]))
                }
            }
        }
        .interpolation(.none)
//        .interpolation(.high)
        .resizable()
        .scaledToFit()
    }
}

struct BitmapCanvasView: View {
    
    let bitmap: Bitmap
    
    var body: some View {
        Canvas(
            opaque: true,
            colorMode: .nonLinear,
            rendersAsynchronously: false
        ) { ctx, size in
            let cellWidth = (size.width / CGFloat(bitmap.columns))
            let cellHeight = (size.height / CGFloat(bitmap.rows))
            for row in 0 ..< bitmap.rows {
                for column in 0 ..< bitmap.columns {
                    let path = Path(
                        CGRect(
                            x: CGFloat(column) * cellWidth,
                            y: CGFloat(row) * cellHeight,
                            width: cellWidth,
                            height: cellHeight
                        )
                    )
                    /*
                     アンチエイリアス（anti-aliasing）とは、
                     コンピュータで文字や図形を描画する際に、
                     斜線や曲線などのギザギザを目立たなくする処理です。﻿
                     */
                    ctx.fill(
                        path,
                        with: .color(bitmap.values[row][column]),
//                        style: .init(eoFill: false, antialiased: true)
                        style: .init(eoFill: false, antialiased: false)
                    )
                }
            }
        }
        .aspectRatio(bitmap.aspectRatio, contentMode: .fit)
    }
}

struct BitmapDividersView: View {
    
    let bitmap: Bitmap
    var lineWidthRatio: CGFloat? = 0.05 // ratio of cell size
    var lineColor: Color? = .white
    
    var body: some View {
        Canvas(
            opaque: true,
            colorMode: .nonLinear,
            rendersAsynchronously: false
        ) { ctx, size in
            let cellWidth = (size.width / CGFloat(bitmap.columns))
            let cellHeight = (size.height / CGFloat(bitmap.rows))
            for row in 0 ..< bitmap.rows {
                for column in 0 ..< bitmap.columns {
                    let path = Path(
                        CGRect(
                            x: CGFloat(column) * cellWidth,
                            y: CGFloat(row) * cellHeight,
                            width: cellWidth,
                            height: cellHeight
                        )
                    )
                    ctx.fill(
                        path,
                        with: .color(bitmap.values[row][column]),
                        style: .init(eoFill: false, antialiased: false)
                    )
                }
            }
            
            if let lineWidthRatio, let lineColor {
                let lineWidthHorizontal = lineWidthRatio * cellHeight
                let lineWidthVertical = lineWidthRatio * cellWidth
                if bitmap.rows > 2 {
                    for row in 1 ... bitmap.rows - 1 {
                        let linePath = Path { p in
                            p.move(to: CGPoint(x: 0, y: CGFloat(row) * cellHeight))
                            p.addLine(to: CGPoint(x: size.width, y: CGFloat(row) * cellHeight))
                        }
                        ctx.stroke(linePath, with: .color(lineColor), lineWidth: lineWidthHorizontal)
                    }
                }
                if bitmap.columns > 2 {
                    for column in 1 ... bitmap.columns - 1 {
                        let linePath = Path { p in
                            p.move(to: CGPoint(x: CGFloat(column) * cellWidth, y: 0))
                            p.addLine(to: CGPoint(x: CGFloat(column) * cellWidth, y: size.height))
                        }
                        ctx.stroke(linePath, with: .color(lineColor), lineWidth: lineWidthVertical)
                    }
                }
            }
        }
        .aspectRatio(bitmap.aspectRatio, contentMode: .fit)
    }
}

// MARK: - Preview

#Preview("NativeImageView", traits: .sizeThatFitsLayout) {
    NativeImageView()
        .padding()
        .border(.black)
        .padding()
}

#Preview("BitmapImageView", traits: .sizeThatFitsLayout) {
    BitmapImageView(bitmap: .mockGrid(rows: 10, columns: 10))
        .padding()
        .border(.black)
        .padding()
}

#Preview("BitmapCanvasView", traits: .sizeThatFitsLayout) {
    BitmapCanvasView(bitmap: .mockRowColors(rows: 10, columns: 10))
        .frame(width: 301) // Forcing this width will show antialiasing artifacts
        .border(.black)
        .padding()
}

#Preview("BitmapDividersView", traits: .sizeThatFitsLayout) {
    BitmapDividersView(bitmap: .mockRowColors(rows: 10, columns: 10))
        .frame(width: 301)
        .padding()
        .border(.black)
        .padding()
        .background(Color.gray)
}

#Preview("BitmapDividersViewWithBorder", traits: .sizeThatFitsLayout) {
    BitmapDividersView(bitmap: .mockRowColors(rows: 10, columns: 10))
        .frame(width: 300)
        .padding(2)
        .border(.white, width: 2)
        .padding()
        .background(Color.black.opacity(0.8))
}
```

</details>

## [Indie, Not Alone](https://ryanashcraft.com/indie-not-alone/)

- インディーズとは一人で全部することではない
- フリーランサーと働く
    - 戦略的になり人を雇うことに恐れないこと。今なら便利なサービスがある
- 仲間やメンターを見つける
    - 一番簡単なのはネットワークを作ること
    - 大事なのは自分らしくいること、取り組んでいることを共有すること、そして他人と関わること
    - SNSは単に情報を発信するだけでなくつながりを持つことが大事。質問をしたり議論に参加したり、できるときには他人を助けてあげる
    - カンファレンスに参加する
        - 内向的な人にとっては疲れるかもしれないが、同じような考えの人と出会い関係を強化する貴重な機会
- 第三の場所を見つける
    - 自宅・職場以外の人が交流していてくつろげる社交的な環境のこと
    - 簡単なのは数時間喫茶店にいくこと
- AIチャットボット

>何時間も、時には何週間も悩み続ける代わりに、ChatGPT は疑似アドバイザー、共同設立者、同僚、さらにはセラピストとして機能します。

- 派手なRubber Duck Debuggingのみたいなものである
    - https://en.wikipedia.org/wiki/Rubber_duck_debugging?ref=ryanashcraft.com
- 孤独にならない一番の利点…
    - 恩返しできること。自分が望んだメンターになったり、自分の歩みを共有し、ブログやSNSを投稿して他の人の助けとなろう

