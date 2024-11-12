# [iOS Dev Weekly - Issue 683](https://iosdevweekly.com/issues/683)

## Comment

- macOS15 で画面録画の許可画面が繰り返し出る問題、やっぱアレだよねーという話
- 15.1 で定期的にアプリを利用する際は頻度が減るようになる
- [考え: アプリレビューは、アプリストアのアプリにコア機能のデフォルト権限を付与すべき](https://blog.eternalstorms.at/2024/08/06/thought-app-review-should-grant-core-function-default-entitlements-to-apps-on-the-app-stores/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)
- App Store に出す前にレビューしているんだから、デフォルトで権限を与えてもいいんじゃない？という案
  - [Thought: App Review Should Grant Core\-Function Default Entitlements to Apps on the App Stores](https://blog.eternalstorms.at/2024/08/06/thought-app-review-should-grant-core-function-default-entitlements-to-apps-on-the-app-stores/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)
  - 実際は悪意のあるアプリがあるから難しいとは承知しているけどね
  - でもこれだと App Review の存在が疑問視だよと

## [New requirement for app updates in the European Union](https://developer.apple.com/news/?id=yfacfeal&utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)

- EU の配信要件を更新していない人へ
- 今日からアプリがアップデートが配信されなくなる
- また 2025/2/17 からは削除までしちゃうよ

## [Apple Push Notification service server certificate update](https://developer.apple.com/news/?id=09za8wzy&utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)

- プッシュ通知のサーバ証明書が更新される
- 来年 1,2 月に更新するから新旧のサーバ証明書を含めるようにしてね

## [Beware UserDefaults: a tale of hard to find bugs, and lost data](https://christianselig.com/2024/10/beware-userdefaults/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)

- UserDefaultsにバグがある話
- タイミングによって読み取ることができず、初期値として取得され、前のデータが失われてしまう場合がある
- デバイスがロック中にもアプリが動く場合がある
  - 1 つが iOS15 からの[prewarming](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app/about_the_app_launch_sequence)で、アプリケーションを起動する前にいくつかのプロセスだけをあらかじめ実行しておく

> プレウォーミングは、main() が UIApplicationMain(:::: :)を呼び出すまでのアプリの起動シーケンスを実行します (その呼び出しは含まれません)。

- 他にも Live Activity の場合
  - デバイスを再起動すると 100%でアプリがバックグラウンドで起動しても UserDefaults が読み取れない
  - 最初にロックが解除されるまで UserDefaults が暗号化される
- 解決策を考える
- [isProtectedDataAvailable](https://developer.apple.com/documentation/uikit/uiapplication/1622925-isprotecteddataavailable)を見る方法があるが、厳密に UserDefaults の利用可否と一致しない問題がある
- 筆者が選んだのはUserDefaultsの代替となるようにファイルを作成してそこに保存する方法
- `App Groups`にIdentifierを設定

![image](https://i.imgur.com/nTZ8u0D.png)

- コードはこんな感じ
- [protectionKey](https://developer.apple.com/documentation/foundation/fileattributekey/1616632-protectionkey)をファイル属性に設定してUserDefaultsのようなロックを防いでいるよう

```swift
// Example thing to save
let favoriteIceCream = "chocolate"

// Save to your app's shared container directory so it can be accessed by other targets outside main
let appGroupID = ""

// Get the URL for the shared container
guard let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID) else {
    fatalError("App Groups not set up correctly")
}

// Create the file URL within the shared container
let fileURL = containerURL.appendingPathComponent("Defaults")
    
do {
    let data = favoriteIceCream.data(using: .utf8)
    try data.write(to: fileURL)

    // No encryption please I'm just storing the name of my digital cow Mister Moo
    try FileManager.default.setAttributes([.protectionKey: .none], ofItemAtPath: fileURL.path) // ここ.none -> 0 as NSNumberかも?
    print("File saved successfully at \(fileURL)")
} catch {
    print("Error saving file: \(error.localizedDescription)")
}
```

- こんな感じに保存される

![image](https://i.imgur.com/55vDdBS.png)

- そしてこれをパッケージ化したライブラリがあります！
- [christianselig/TinyStorage](https://github.com/christianselig/TinyStorage)
- `@AppStorage`ライクなものも用意されていて便利そう

![image](https://i.imgur.com/t7pnx0M.png)

- 保存の仕方も`.plist`でUserDefaultsライクになってます

![image](https://i.imgur.com/yUccTis.png)

## [Migrating Combine to AsyncAlgorithms](https://blog.jacobstechtavern.com/p/migrating-combine-to-asyncalgorithms?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)
- Combineを使っていて移行したくないけど、2021年にリリースされた[swift\-async\-algorithms](https://github.com/apple/swift-async-algorithms)で完全にCombine < Swift Concurrencyとなったので移行するときの話
- (序文以降は未読)

## [Reinventing Core Data Development with SwiftData Principles](https://fatbobman.com/en/posts/reinventing-core-data-development-with-swiftdata-principles/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)
- iOS18現在、SwiftDataには安定性と信頼性がないのでCoreDataを選択した話
- SwiftDataのデータモデルやConcurrencyの優れた点をCoreDataに活かす方法を探り、その実装方法について考える
- (詳しい実装は未読)

## [Migrating Combine to AsyncAlgorithms](https://blog.jacobstechtavern.com/p/migrating-combine-to-asyncalgorithms?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20683)

- zip ライブラリもあるけど、解凍を必要としない場合は API で十分
  - https://github.com/marmelroy/Zip
- (たしかに簡単にはかけるのはわかる…けどライブラリにまかせたくなっちゃう気はする😂)
