# [Explore concurrency in SwiftUI](https://www.youtube.com/watch?v=Ttxz8bVvX3s)


## 00:00 - Introduction
## 02:13 - Main-actor Meadows

![](https://i.imgur.com/rB3tZCw.jpeg)

![](https://i.imgur.com/XYp51Fh.jpeg)

![](https://i.imgur.com/QRcM5Yp.jpeg)

基礎的なところは以下のセッションを。

![](https://i.imgur.com/CZnleIu.jpeg)

SwiftUI.Viewは`@MainActor`
継承先のカスタムViewももちろん`@MainActor`

![](https://i.imgur.com/fq58HyL.jpeg)

プロパティも同様

![](https://i.imgur.com/NT0Ac0t.jpeg)

暗黙的に`@MainActor`がつくので、書かなくて良い

![](https://i.imgur.com/hDFbfiS.jpeg)

![](https://i.imgur.com/48gCwlu.jpeg)

Task内は`@MainActor`
`await model.~`は実装先のactor境界内で実行される？

![](https://i.imgur.com/SbSJRoC.jpeg)

![](https://i.imgur.com/TjOg1Jh.jpeg)

## 07:17 - Concurrency Cliffs

![](https://i.imgur.com/LFZ7xQr.jpeg)

![](https://i.imgur.com/0F3SKQb.jpeg)

![](https://i.imgur.com/42Qnbwv.jpeg)

![](https://i.imgur.com/dL7FV7A.jpeg)

![](https://i.imgur.com/8eTghJt.jpeg)

SwiftUIの処理は時折メインスレッド以外で行われる

![](https://i.imgur.com/2qOL7eH.jpeg)

バックグラウンドでpathは作成される

![](https://i.imgur.com/dYBG11J.jpeg)

![](https://i.imgur.com/jE1xKKL.jpeg)

![](https://i.imgur.com/UrAMRlh.jpeg)

[onGeometryChange(for:of:action:) | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/view/ongeometrychange%28for:of:action:%29)

![](https://i.imgur.com/7xPUdHU.jpeg)

Sendableは競争しないで、という旗のようなもの

![](https://i.imgur.com/HjoJxry.jpeg)

![](https://i.imgur.com/xARmnej.jpeg)

![](https://i.imgur.com/HalXi4u.jpeg)

データ競合が起きる例

![](https://i.imgur.com/6416IjB.jpeg)

![](https://i.imgur.com/agYkCGu.jpeg)

![](https://i.imgur.com/VJmv7oF.jpeg)

まずselfを`MainActor`から別のActorに移さないといけない
`self`が`Sendable`である必要がある

![](https://i.imgur.com/tAQrVt5.jpeg)

![](https://i.imgur.com/AaBpiBA.jpeg)

selfはMainActorなのでSendable
問題はpulseへのアクセス

![](https://i.imgur.com/jyYkh9E.jpeg)

![](https://i.imgur.com/4NtOuKA.jpeg)

![](https://i.imgur.com/PyP1Mqy.jpeg)

pulseのコピーを渡している
pulseは単純な値型だからOK

![](https://i.imgur.com/VdShi5x.jpeg)

コピー先のpulseはその関数内に閉じているので、データ競合は発生しない

![](https://i.imgur.com/23OqB45.jpeg)

![](https://i.imgur.com/hjnVoFb.jpeg)

## 16:53 - Code Camp

![](https://i.imgur.com/SbcYulO.jpeg)

![](https://i.imgur.com/4qdMsZv.jpeg)

![](https://i.imgur.com/UPHYfva.jpeg)

![](https://i.imgur.com/hsgemJa.jpeg)

![](https://i.imgur.com/gq31zqr.jpeg)

![](https://i.imgur.com/ISf9M1D.jpeg)

![](https://i.imgur.com/P8YRRpI.jpeg)

![](https://i.imgur.com/PqJhmg0.jpeg)

![](https://i.imgur.com/5AUFQTV.jpeg)

![](https://i.imgur.com/NZS5hxj.jpeg)

![](https://i.imgur.com/3gqFWaw.jpeg)

アンチパターンの例
`await someConcurrentWork`のせいでアニメーションがずれる可能性がある
同じフレーム内で達成するのが良い

![](https://i.imgur.com/vPAW5Q8.jpeg)

上記の例があるので、async関数はアニメーションがある場合は特に気をつけよう

![](https://i.imgur.com/DL12HbJ.jpeg)

![](https://i.imgur.com/MEfH7XG.jpeg)

ロジックをViewからasync関数として分離しよう

![](https://i.imgur.com/0QAMAY0.jpeg)

asyncはユニットテストが書きやすいメリットが有る
UIロジックから独立しているから

![](https://i.imgur.com/CKtztma.jpeg)

Task内はシンプルに記述すること

![](https://i.imgur.com/gjoDwA4.jpeg)

![](https://i.imgur.com/IrFySKA.jpeg)

## 23:47 - Next steps

![](https://i.imgur.com/Nz7gRRH.jpeg)

![](https://i.imgur.com/ZO7A0nq.jpeg)
