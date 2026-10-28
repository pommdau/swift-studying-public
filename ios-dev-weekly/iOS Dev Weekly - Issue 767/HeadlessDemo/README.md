# HeadlessDemo

macOS CLIから入力した行をWebSocketで送り、iOSアプリで解釈・表示するデモです。

## 動かし方

1. `HeadlessDemoMain/HeadlessDemoMain.xcodeproj` を開き、DebugビルドでSimulator上に起動します。
2. 同じプロジェクトの `HeadlessDemoCLI` スキームをビルドし、CLIを引数なしで起動します。
3. 以下のように1行ずつ入力します。Ctrl-Dで終了します。

```text
do selectTab {"tabID" : "Products"}
✓ selectTab
do openItem {"id": "gid://shopify/Product/12345"}
✓ openItem
ls
✓ ls
do SetTitle {"title": "New Title!"}
✓ SetTitle
do Save
✓ Save
```

実行ファイルのあるディレクトリで起動します。

```sh
./HeadlessDemoCLI
```

CLIはコマンド解析、JSON検証、help表示を行いません。接続先は `ws://127.0.0.1:8765` 固定です。
標準入力の各行を1つのWebSocketテキストメッセージとして送信し、応答に改行を付けて標準出力に書き出します。
CLIは `URLSessionWebSocketTask`、アプリは Network.framework の `NWListener` と `NWProtocolWebSocket` を使用します。

iOS側は `do <任意の操作名> [JSONオブジェクト]` と `ls` を解釈し、受信した入力・コマンド・操作名・パラメータを表示します。
操作名ごとの処理や保存処理はありません。`✓` は解析できたことを示します。
`ls` も最新入力として表示します。現在の応答は解析結果の短いテキストで、状態JSONの取得は未実装です。JSONの値には数値、真偽値、配列、入れ子のオブジェクトも使用できます。
接続は入力間で維持し、1入力につき1つのテキスト応答を返します。Ctrl-Dで接続を閉じます。
通信失敗時はエラーを表示し、次の入力で再接続します。操作の二重実行を避けるため、失敗した入力は自動再送しません。
