# [iOS Dev Weekly - Issue 684](https://iosdevweekly.com/issues/684)

## Comment

- WWDC2025 まであと 7 ヶ月

## [TestFlight enhancements to help you reach testers](https://developer.apple.com/news/?id=fps422ld&utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20684)

- TestFlight の機能強化
- 招待状のデザインの一新
  - アプリの説明・カテゴリ・スクリーンショットを含められる
  - またユーザからフィードバックをもらう方法も追加され、例えば参加しなかった理由がわかる

![image](https://i.imgur.com/cbPFLO5.png)

- テスターの登録
  - デバイスや OS のバージョンを指定して、公開リンクによってより対象を絞ってフィードバックが得られる
- 公開リンクのメトリクスが取得できるように

![image](https://i.imgur.com/fENUgDY.png)

## [App development on iPad](https://mutatingfunc.github.io/blog/2024-10-12-app-development-on-ipad/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20684)

- iPad の Swift Playgrounds による開発
- Xcode と比べてプレビューが快適。リロードボタンを押す必要がない
- Swift のみサポート。objective-c はサポートしていない。SwiftUI 以外にも UIKit をサポート
- Git 管理もできる
- Package も作れる
- 欠点
  - Target/Scheme のサポートがない
  - シュミレーターがなく必要なスクリーンショットを取るのが大変
  - 更新頻度がチームの気の向いたとき。通常、新しい主要な OS リリースから Playgrounds で SDK を実際に使用できるようになるまでには、1 ～ 2 か月かかります。
- まとめ
  - Xcode の代替品になりうる感じ

## [Test your Swift Packages Linux Compatibility on Mac](https://www.fline.dev/test-your-swift-packages-linux-compatibility-on-mac/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20684)

- Swift パッケージが Linux で互換性があるかをテストする方法
- アプリケーションからネットワークのコードを抽出して、Vapor サーバで再利用するというユースケース
- その際 Docker を使えばいいよ、という話。設定とか実際する際の参考になりそう。

## [Making charts accessible with Swift Charts](https://www.createwithswift.com/making-charts-accessible-with-swift-charts/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20684)

- Swift Charts のアクセシビリティについて
- Apple は VoiceOver とするためにかなり頑張ってる
- x/y 軸を説明する例

![image](https://i.imgur.com/YqsLaPq.png)

- グラフを音の高低で表現する

![image](https://i.imgur.com/2n829iK.png)

- 詳細のモーダルを開く

![image](https://i.imgur.com/FsCAD5X.png)

- 色については下記が参考になる
  - [Using Colors and Contrast Ratio to ensure Visual Accessibility](https://www.createwithswift.com/using-colors-and-contrast-ration-to-ensure-visual-accessibility/)
- 全く色が見えない人のためにシンボルを使用する
  - [Ensure Visual Accessibility: Glyphs, Icons and Shapes](https://www.createwithswift.com/ensure-visual-accessibility-glyphs-icons-and-symbols/)
- Accessibility Chart Descriptor
  - `AXChartDescriptor`というクラスが用意されている

![image](https://i.imgur.com/0I4z05u.png)

```swift
struct ChartDescriptor: AXChartDescriptorRepresentable {

    var dataCollection: ViewModel

    func makeChartDescriptor() -> AXChartDescriptor {

        let xAxis = AXCategoricalDataAxisDescriptor(
            title: "Month",
            categoryOrder: dataCollection.data.map(\.month)
        )

        let max = dataCollection.data.map(\.temperature).max() ?? 0.0

        let yAxis = AXNumericDataAxisDescriptor(
            title: "Temperature",
            range: 0...max,
            gridlinePositions: []
        ) { value in
            "\(value) points"
        }

        let series = AXDataSeriesDescriptor(
            name: "",
            isContinuous: false,
            dataPoints: dataCollection.data.map {
                .init(x: $0.month, y: $0.temperature)
            }
        )

        return AXChartDescriptor(
            title: "Chart representing some data",
            summary: "Summary data",
            xAxis: xAxis,
            yAxis: yAxis,
            additionalAxes: [],
            series: [series]
        )
    }
}
```

- 適用例

```swift
struct ChartView: View {

    var dataCollection: ViewModel

    var body: some View {

        Chart(dataCollection.data) {
            LineMark(
                x: .value("Month", $0.month),
                y: .value("Average Temperature", $0.temperature)
            )
        }
        .accessibilityChartDescriptor(
            ChartDescriptor(dataCollection: dataCollection))
    }
}
```

- これで先程の詳細モーダルに表示される情報が更新される

![image](https://i.imgur.com/jzl56Fe.png)
