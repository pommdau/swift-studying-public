https://iosdevweekly.com/issues/764/

## Comment
AIエージェントは個別タスクには優れる一方、アプリ全体のパフォーマンスや可観測性、スケーラビリティを把握するのは苦手。
そのため、エンジニアの経験・批判的思考・プログラミングの基礎は依然として重要である。

## [Apple、EU域内でのアプリに対する変更を発表 - Apple (日本)](https://www.apple.com/jp/newsroom/2026/08/apple-announces-changes-for-apps-in-the-european-union/)
- これまで批判の多かったインストール数ベースの「Core Technology Fee（CTF）」が廃止されることです
- 代わりに、App Store外で配信したアプリについては、デジタル取引に対して5%のCore Technology Commission（CTC）を取る方式になります。
-  Apple IAP(In App Perchace)と外部決済を同じアプリ内で併用できるようになること。
  - たとえば「Apple Pay……ではなくApple IAPで購入」と「自社決済」をユーザーに選ばせる、といった構成が可能になります。ただし、選択した決済方式は原則1年間変更できないという制約があります。
  
## [ContentBuilder解説 - SwiftUIの型チェック高速化の秘密](https://fatbobman.com/en/posts/contentbuilder-explained/)
- `@ViewBuilder`の高速化の話
- Group内の型を推論するのではなく、作成してから型を判別することによる

>「一つの汎用的な入口で構造を作り、conditional conformanceで能力を後から決める設計」
>に変えたことが本質です。

## [The @State Macro: What Xcode 27 Stops Compiling](https://blakecrosley.com/blog/state-macro-xcode-27)
- `@State`の改善
- Development VersionにかかわらずXcode27で有効になる
- Viewが作成されるたびに`Model()`も再作成されていたが、Xcode27から初回だけになる
- 下記のとき"sample"と表示される不具合がおきる問題があった。Xcode27からはコンパイルエラーで気付けるようになる

```swift
struct Model {
    var name: String = "sample"
}

struct MyView: View {

    @State private var model = Model()

    init(name: String) {
        self.model = Model(name: name)
    }
    
    var body: some View {
        Text(model.name)
        Button("Func") {
            print(model.name)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            MyView(name: "huga")
        }
        .padding()
    }
}
```

また下記のように全プロパティがprivateだと、Swiftコンパイラが内部的にmemberwise initializerを作るケースがあったが、作られなくなった

```Swift
struct MyView: View {
    @State private var model: Model
    private let title: String
}
```

## [iOS 27: StateReporter - Anton's Substack](https://antongubarenko.substack.com/p/ios-27-statereporter)
- 新しく`StateReporting`が追加
- MetricKitのパフォーマンス情報にアプリの文脈を追加することができるようになった
- データは下記の二種類で分類して、前述のものが変化した際にレポートするようにすると良い
- ログではなく、何らかの意味のある変化が起こるまでアクティブな状態を維持するものです。

```
Stable Metadata
→ 状態を分類するための情報
→ あまり変化しない

Volatile Metadata
→ 状態の途中で変化する情報
→ 頻繁に変わってよい
```

>状態レポート機能が真価を発揮するのは、アプリケーションに既に明確に識別可能な機能状態があり、かつパフォーマンス診断が重要な場合です。

## [リードソフトウェアエンジニアとして意思決定を迅速化するためのフレームワーク | モハメッドによるTIL](https://mfaani.com/posts/career/a-framework-to-make-decisions-faster-as-a-lead-software-engineer/)
- 70%が正しいと思ったら先に進む。軌道に乗った後で最適化できる
- デフォルトの設定を選択する。カスタムする場合もシンプルに、安価で速いものを選択。
- 書き留める
    - 思考プロセスを書き残す。検討の代替案と選択理由を記録
    - 不安点も文書化して残しておく
- 評価
    - 最終決定のフィードバックを得て、また最終承認を得る
    - その時点で判断できる最善であれば仕方がない
- それにコミットする
    - 手順と計画を書き出し、それに真剣に取り組む。別のもの並行しているならそれは真剣とは言えない。
    - 一定期間2週間,2ヶ月とかをコミットして、それからまた再検討する
  
##  [批判的思考力を養いながらAIを活用する](https://swiftrocks.com/using-ai-without-losing-critical-thinking)
- AIの言うことをそのまま信じない、肉の代理人に成り下がる
- AIの言うことに対して批判的な思考を適用し、AIを適切にハンドリングすることで他のエンジニアと差別化できる
- 言うことに対して、証拠を求めるなど二重チェックする
    - Stop Hookを使用するとこれを自動化できる
- 生成されたコードを1行ずつ読む
    - 今後改善されると思うが、今はコーディング力を失わないためにも、常にやっておくと良い
    - またコードの変更点をきちんと理解できる
    - 動くコードは簡単だが最適ではない
    - 複雑で重複が多く、関心の分離がまったく無くエッジケースの処理も間違っているだおう

## [推移的依存関係を減らすためにライブラリを「特性化」する](https://www.pointfree.co/blog/posts/216-trait-ifying-our-libraries-to-reduce-transitive-dependencies)
- Swift 6.2で導入されたSwift Package Manager（SwiftPM）の「Traits」を使って、欲しいライブラリだけをインポートできる

## [パッケージレジストリとは何か？（Swift Package Indexブログより） – Swift Package Index](https://swiftpackageindex.com/blog/what-is-a-package-registry)
- 通常はソースリポジトリから取得しているが、package registryではアーカイブ形式で提供されたソースコードを利用する

```swift
dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.8.2")
]
```

```swift
dependencies: [
    .package(id: "apple.swift-argument-parser", from: "1.8.2")
]
```

- Gitの履歴を含まないため、ダウンロードサイズが最小で済む
- またパッケージにはソースコードが含まれており、依然としてデバイス上のビルドが必要
- レジストリでホストされるパッケージは、変更不可能で検証済みとして提供されるのでよりセキュア

>そしてSwift界隈も、将来的には**「GitHub URLを直接指定する」のが当たり前の世界から、
>npmやPyPIのようにPackage IDで依存ライブラリを取得する世界へ進む可能性がある**、
>というのが今回の記事の面白いところです。

##  [iPhone Fold：私たちが知っていることすべて｜MacRumors](https://www.macrumors.com/roundup/iphone-fold/)
- 2026年9月に登場？
- Face IDではなくTouch ID
- カメラも２つ
- 折りたたみのシワが目立たないような素材をコスト度外視で開発し、実用レベルにまでなった？
