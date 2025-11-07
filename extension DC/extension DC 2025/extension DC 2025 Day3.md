# [extension DC 2025 Day3 @ LINEヤフー - connpass](https://lycorptech-jp.connpass.com/event/362636/)

## S_Shimotori	アメ車でサンノゼを走ってきたよ！
[アメ車でサンノゼを走ってきたよ！ - Speaker Deck](https://speakerdeck.com/s_shimotori/sanjose-carplay)
[(13) アメ車でサンノゼを走ってきたよ！ @S_Shimotori_pub #1 day3 - YouTube](https://www.youtube.com/watch?v=VWI7DSwon0o)

- 終始面白話

## たいやき	overlayPreferenceValue で実現するピュア SwiftUI な AdMob ネイティブ広告

- [overlayPreferenceValue で実現する ピュア SwiftUI な AdMob ネイティブ広告 - Speaker Deck](https://speakerdeck.com/uhucream/overlaypreferencevalue-deshi-xian-suru-piyua-swiftui-na-admob-neiteibuguang-gao)
- [(12) overlayPreferenceValue で実現するピュア SwiftUI な AdMob ネイティブ広告 @UKokkei95Toyama #1 day3 - YouTube](https://www.youtube.com/watch?v=PbG9eMGMoBg)

![](https://i.imgur.com/hSsd8yz.jpeg)

![](https://i.imgur.com/ps0lSRV.jpeg)

![](https://i.imgur.com/lrrkGi5.jpeg)

![](https://i.imgur.com/ZXLX7E4.jpeg)

![](https://i.imgur.com/AIZTPqz.jpeg)

![](https://i.imgur.com/khGWsW4.jpeg)

![](https://i.imgur.com/F2tygr4.jpeg)

- 例えば下記のような事ができる
    - [[SwiftUI] Viewにスポットライトを当てる](https://zenn.dev/ueshun/articles/3ee837c881905e)
- Preferenceは下記がわかりやすい
    - [SwiftUI の Preference の基礎 #iOS - Qiita](https://qiita.com/maiyama18/items/a64bab2094750319ef8d)
    - 子から親に値を渡す仕組み
    - `anchorPreference`は親戚でサイズまで取得できる感じ？

![](https://i.imgur.com/2uhAtdN.jpeg)

- [Uhucream/AdMobUI: You can implement AdMob Native advertisement with fully pure SwiftUI](https://github.com/Uhucream/AdMobUI)
    - 内部的には`UIViewRepresentable`を使って一度Viewを作成し、これをoverlayPreferenceValueで重ね合わせて実現しているのだろうか

![](https://i.imgur.com/OtDH5Vr.jpeg)

## tatsubee	マルチウィンドウ実践ガイド

[マルチウィンドウ実践ガイド - Speaker Deck](https://speakerdeck.com/shoryuyamamoto/marutiuindoushi-jian-gaido)
[(12) マルチウィンドウ実践ガイド @shoryu927 #1 day3 - YouTube](https://www.youtube.com/watch?v=CG_SdwDWnWY)

![](https://i.imgur.com/JXU8fx9.jpeg)

![](https://i.imgur.com/7je6ZFT.jpeg)

![](https://i.imgur.com/Mc18mBe.jpeg)

対応することで差別化できる

![](https://i.imgur.com/LZw1pOb.jpeg)

ウインドウボタンと被らないようにする実装

![](https://i.imgur.com/DtBFTmg.jpeg)

![](https://i.imgur.com/a9OTw7j.jpeg)

![](https://i.imgur.com/5Yg532M.jpeg)

GeometryReaderで取得して、またSafeAreaも意識すること

![](https://i.imgur.com/Y8Mdcxe.jpeg)

![](https://i.imgur.com/UqO0GwE.jpeg)

![](https://i.imgur.com/Cmz3tTq.jpeg)

![](https://i.imgur.com/IpSX4La.jpeg)

D&Dでのウインドウの開き方
![](https://i.imgur.com/kFI0upf.jpeg)

![](https://i.imgur.com/vSf9SiQ.jpeg)

ウインドウに名前をつける

![](https://i.imgur.com/W5sfGMc.jpeg)

![](https://i.imgur.com/K57xr4Q.jpeg)

![](https://i.imgur.com/i7Bcr4k.jpeg)

## laprasDrum	実装で解き明かす並行処理の歴史：Swift ConcurrencyからNSThreadまで遡ろう

[実装で解き明かす並行処理の歴史 - Speaker Deck](https://speakerdeck.com/zozotech/trace-back-from-swift-concurrency-to-nsthread)
[(12) 実装で解き明かす並行処理の歴史：Swift ConcurrencyからNSThreadまで遡ろう @laprasdrum #1 day3 - YouTube](https://www.youtube.com/watch?v=DQFDzIjxmlI)

- 現在ではかなりスッキリかける。ただし昔はどうだったのか1900年代まで遡っていく
- 正直GCDのロック周りも実際に書いたことがないので参考になる。そこまで複雑ではないコードみたい。
- NSThread以前は知らなかったので面白く聞けた

![](https://i.imgur.com/VK0yCGq.jpeg)

## inductor	AppleのContainerization Frameworkから学ぶコンテナ技術の仕組みとその裏側
- 非公開
