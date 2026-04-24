# [Issue 747 – iOS Dev Weekly](https://iosdevweekly.com/issues/747/)
## Comment
- Open VSX(どのIDEからでも使えるVS Codeの拡張機能ストア的なもの)により、VSCodeなどのXcode以外のIDEもより使いやすくなっている
    - [SwiftのIDEサポートを拡張 | Swift.org](https://www.swift.org/blog/expanding-swift-ide-support/)

## [Introducing Untold Engine — A 3D renderer written in Swift using Metal - Community Showcase - Swift Forums](https://forums.swift.org/t/introducing-untold-engine-a-3d-renderer-written-in-swift-using-metal/85702)
- Swiftで書かれたMetalベースのゲームエンジン
- まだ開発段階中のものっぽいけど、実際に製品に組み込んでいる例もある
- RealityKitより柔軟で、これをSwiftアプリに組み込めるのが利点

## [Xcode 26.4 Simulator Paste Is Broken: Here’s the Workaround | @samwize](https://samwize.com/2026/03/30/xcode-simulator-paste-broken-workaround/)
- Xcode 26.4のiOSシュミレーターでペースト機能が壊れている
- 代替のコマンド

```bash
pbpaste | xcrun simctl pbcopy booted
```

> pbpaste
> → macOSのクリップボードにある内容を取り出す
> |（パイプ）
> → 前のコマンドの出力を、次のコマンドに渡す
> xcrun simctl pbcopy booted
> → 起動中（booted）のiOSシミュレータのクリップボードに内容をコピーする

## [What’s that “structured” in Structured Concurrency?](https://macguru.dev/whats-that-structured-in-structured-concurrency/)

- トップレベルのTaskを避ける。よりシンプルに解決できることが多い。
- (詳細に見れていないので、気になる場合は再読)

```swift
func subtaskUpdate() async {
  let subtask: () async -> Void = …
  
  await subtask()
  
  if !Task.isCancelled {
    update()
  }
}
```

## [Playing in the Mac App Sandbox](https://troz.net/post/2026/playing_mac_sandbox/)
- MacのSandboxの話
- アプリだけがアクセスできるフォルダが作成される

![](https://i.imgur.com/dKiuwr1.jpeg)


- `.fileImporter`によるユーザが選択したフォルダへのアクセス

```swift
@State private var showFileImporter = false

.fileImporter(
  isPresented: $showFileImporter,
  allowedContentTypes: [.image]
) { result in
  switch result {
  case .success(let url):
    imageUrl = url
  case .failure(let error):
    print("Image import failed: \(error.localizedDescription)")
  }
}
```

上記の場合、下記の追加の操作が必要になる

>そうしないとアプリがカーネルリソースをリークすると強く主張しています。

```swift
// url.startAccessingSecurityScopedResourceによる作成が必要
case .success(let url):
  let gotAccess = url.startAccessingSecurityScopedResource()
  if gotAccess {
    imageUrl = url
  }
  
// 利用が終わったらアクセス権限を廃棄
.onAppear {
  imageUrl?.stopAccessingSecurityScopedResource()
}
```

- URLの保存は、URLにセキュリティScopeを付与したData型を利用する必要がある
    - [bookmarkData(options:includingResourceValuesForKeys:relativeTo:) | Apple Developer Documentation](https://developer.apple.com/documentation/foundation/nsurl/bookmarkdata%28options:includingresourcevaluesforkeys:relativeto:%29)

```swift
@AppStorage("storedBookmark") private var storedBookmark: Data?

func saveBookmarkData(for url: URL) {
  if let bookmarkData = try? url.bookmarkData(options: .withSecurityScope) {
    storedBookmark = bookmarkData
  }
}

.onAppear {
  if let imageUrl {
    saveBookmarkData(for: imageUrl)
    imageUrl.stopAccessingSecurityScopedResource()
  }
}
```

- 保存したブックマークから画像を再読み込みする
- [init(resolvingBookmarkData:options:relativeTo:bookmarkDataIsStale:) | Apple Developer Documentation](https://developer.apple.com/documentation/foundation/url/init%28resolvingbookmarkdata:options:relativeto:bookmarkdataisstale:%29-3ic6f)

> bookmarkDataIsStale
> 戻り値として、もし であればtrue、ブックマークデータは古くなっています。アプリは、返された URL を使用して新しいブックマークを作成し、既存のブックマークの保存済みコピーの代わりにそれを使用する必要があります。

```swift
func loadImageUrlFromBookmark() {
  // AppStoregeに保存されていないなら何もしない
  guard let storedBookmark else {
    return
  }
  
  // URLの解決。移動や削除されているか確認する
  var isStale = false
  guard let url = try? URL(
    resolvingBookmarkData: storedBookmark,
    options: [.withSecurityScope],
    relativeTo: nil,
    bookmarkDataIsStale: &isStale
  ) else {
    return
  }
  
  // セキュリティScpeによるアクセスの試み
  let gotAccess = url.startAccessingSecurityScopedResource()
  if !gotAccess {
    return
  }
  
  # ブックマークが古くなっている場合は更新
  imageUrl = url
  if isStale {
    saveBookmarkData(for: url)
  }
}
```

これを呼び出し時に読み込む

> その後、アプリを終了し、画像ファイルを別のフォルダに移動します。アプリを再度起動すると、新しい場所から画像が読み込まれるので、これは非常に素晴らしい機能だと思います。

```swift
VStack {}
.onAppear(perform: loadImageUrlFromBookmark)
```

- `usr`/`opt`のReadOnlyの権限を取得したい場合
- plistの`Sandbox.entitlements`を作成

![](https://i.imgur.com/Y6ljNju.jpeg)

![](https://i.imgur.com/cKsCiOP.jpeg)

アプリが`entitlements`を利用するための設定

![](https://i.imgur.com/TczoA2P.jpeg)

## [Challenges with Ancient Dates in Apple SDKs](https://casualprogrammer.com/blog/2026/03-27-old-dates-in-apple-sdks.html)

> 一般の人は「このテキストが切り取られないようにできますか？」と尋ねるでしょう。一方、経験豊富なiOS開発者は「このテキストに.minimumScaleFactor修飾子を適用し、フォントサイズをハードコーディングするのではなく、テキストスタイルを使用していることを確認してください」と答えるでしょう。
> 
> 即興で？見た目上は、最初は同じ結果になるかもしれません。しかし、まあ、分かる人には分かるでしょう。客観的に見て、片方が優れているのです。そして、その言語を話せる私たちは、依然として最高のアプリを作り続けるでしょう。以前にも述べたように、同じスキルが依然として勝利を収め、ツールが変わっただけです。しかし、これは私の唯一の懸念を浮き彫りにします。それは、次世代がコーディングに対して、頑固さゆえに無知な態度を取るかもしれないということです。もし、その手軽さに誘惑されて、子供（あるいは誰であれ）が物事の仕組みを真に学ぶことを怠るようになれば、彼らは必要なスキルを失ってしまうでしょう。
