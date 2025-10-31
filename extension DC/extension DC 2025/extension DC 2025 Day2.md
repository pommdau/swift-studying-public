# [extension DC 2025 Day2 @Sansan - connpass](https://sansan.connpass.com/event/362403/)

## 5分LT枠   とんとんぼ   extension 現場で使えるXcodeショートカット一覧
- [extension 現場で使えるXcodeショートカット一覧 - Speaker Deck](https://speakerdeck.com/ktombow/extension-xian-chang-deshi-eruxcodesiyotokatuto-lan?slide=7)
- 知らなかったやつ
    - `Command + L`で行戦tなく
    - `Command + Shift + J`で現在のファイル選択
    - `Cmmand + y`: ブレイクポイントのアクティブ化

![](https://i.imgur.com/q373VEb.jpeg)

- カスタムしたい場合はファイルを作成して、GitHub経由で管理すると良い

![](https://i.imgur.com/rd09XvT.jpeg)

![](https://i.imgur.com/19BjR7L.jpeg)


## 5分LT枠   y.imajo 今中途半端なSwift 6対応をするより、Default ActorやApproachable Concurrencyを有効にしてからでいいんじゃない？

- [いま中途半端なSwift 6対応をするより、Default ActorやApproachable Concurrencyを有効にしてからでいいんじゃない？ - Speaker Deck](https://speakerdeck.com/yimajo/imazhong-tu-ban-duan-naswift-6dui-ying-wosuruyori-default-actoryaapproachable-concurrencywoyou-xiao-nisitekaradeiinziyanai)
- [(72) 今中途半端なSwift 6対応をするより、Default ActorやApproachable Concurrencyを有効にしてからでいいんじゃない？ @yimajo #1 day2 - YouTube](https://www.youtube.com/watch?v=2y4dFhIv0rE)

![](https://i.imgur.com/HReAFh4.jpeg)

![](https://i.imgur.com/Cl0U0ev.jpeg)

![](https://i.imgur.com/UiZeAoE.jpeg)

- 下記それぞれの詳細がスライドで説明されているので、必要なときは参考になりそう

![](https://i.imgur.com/UETjprF.jpeg)

![](https://i.imgur.com/y1SKQgH.jpeg)

## 5分LT枠   Masashi Kawabe  SpeechAnalyzer による Speech to Text の進化を探る

![](https://i.imgur.com/r0HZQw7.jpeg)

![](https://i.imgur.com/THjd1mL.jpeg)

![](https://i.imgur.com/OwtuEnI.jpeg)

![](https://i.imgur.com/SxibXkT.jpeg)

![](https://i.imgur.com/4RJZQ3w.jpeg)

![](https://i.imgur.com/z7c2iad.jpeg)

### [SpeechAnalyzer APIとは何か？Appleの最新オンデバイス音声認識技術の概要と特徴を解説 | 株式会社一創](https://www.issoh.co.jp/tech/details/8929/)

>例えば1時間以上の講義や会議の音声データでも、途中で途切れることなく最後まで認識を続行可能です。従来のSFSpeechRecognizerは連続して使える時間やデータサイズに制限がありましたが、新APIではそうした制約が大幅に緩和されました

>またサーバー通信が不要になったことで、ネットワーク遅延もゼロとなり、常に一定で高速な応答が得られる利点もあります。オンデバイス処理への全面移行は、ユーザーの信頼性向上と体験向上に直結する大きな進化点です。

>SpeechAnalyzerの音声認識モデルは、Appleのデバイスに搭載されたNeural Engineや高性能CPU上で動作するよう最適化されています。

>SpeechAnalyzerの音声認識モデルはシステムにより管理・提供されており、OSアップデートやバックグラウンドのモデル更新によって常に最新の性能を維持できます。

- 公式の説明
    - [SpeechAnalyzer：高度な音声テキスト変換をアプリに追加 - WWDC25 - ビデオ - Apple Developer](https://developer.apple.com/jp/videos/play/wwdc2025/277/)

## 5分LT枠   pihero  Kotlin/Native の Objective-C Export と Swift Export

- [(72) KMPのSwift Export @pihero13 #1 day2 - YouTube](https://www.youtube.com/watch?v=a8oAQtUa-Vo)
- [KMP の Swift export - Speaker Deck](https://speakerdeck.com/kokihirokawa/kmp-no-swift-export)
- 現状のKMPはObjcを介しているので、Swiftらしくない問題

![](https://i.imgur.com/7q8ai2c.jpeg)

- これをSwiftにする方向で開発中(まだExperimental)

![](https://i.imgur.com/Lg5YOQP.jpeg)

## 10分トーク枠 Musa    SpeechAnalyzerによる音声文字起こしの罠

![](https://i.imgur.com/HU5ICJF.jpeg)

![](https://i.imgur.com/7etrhnU.jpeg)

![](https://i.imgur.com/QnPPYOI.jpeg)

- 現状リアルタイムの精度が悪い
- 音声ファイルを介すと改善する

![](https://i.imgur.com/95rpX4T.jpeg)

## 10分トーク枠 touyoubuntu Liquid GlassとAppIntentsについての考察

- [Liquid GlassとApp Intents - Speaker Deck](https://speakerdeck.com/touyou/liquid-glasstoapp-intents)
- [(72) Liquid GlassとAppIntentsについての考察 @touyou_dev #1 day2 - YouTube](https://www.youtube.com/watch?v=07LIxk1ow1Q)

- これはコレクションビューではなく、AppIntentによりアプリが返した検索結果をiOSで表示しているだけ
- このようにアプリとOSの境界が消えて溶け込んでいく

![](https://i.imgur.com/OckzM7z.jpeg)

- アイコンのデザイン変更もアプリの存在感を減らしていくといえる

![](https://i.imgur.com/QESm7m1.jpeg)

- アプリにとらわれずに、アプリのコンテンツを提供していくということだろうか

![](https://i.imgur.com/iRWoiMQ.jpeg)

- そうするためにどういう設計をしていくべきか

![](https://i.imgur.com/CO5Njoh.jpeg)

![](https://i.imgur.com/cVJ9VP4.jpeg)

## 20分トーク枠 RioFujimon  Foundation Models 実践 Tips

[(72) Foundation Models を活用するための Tips @RioFujimon #1 day2 - YouTube](https://www.youtube.com/watch?v=1LD1ZrtxSCw)
[Foundation Models を 活用するための Tips - Speaker Deck](https://speakerdeck.com/riofujimon/foundation-models-wo-huo-yong-surutameno-tips?slide=2)

![](https://i.imgur.com/1WLxhtb.jpeg)

![](https://i.imgur.com/IaJp1cK.jpeg)

![](https://i.imgur.com/C12pl7P.jpeg)

- Foundation Modelが不要なパラメータもモデルに含まれてしまっている

![](https://i.imgur.com/H1SqtW3.jpeg)

![](https://i.imgur.com/2GyLOSv.jpeg)

![](https://i.imgur.com/TMGI6AV.jpeg)

- 検索対象を絞り込んだ状態

![](https://i.imgur.com/pr4mvuu.jpeg)

![](https://i.imgur.com/qFpd8U5.jpeg)

![](https://i.imgur.com/nLe8u4n.jpeg)

- 検索しやすいようにモデルを特化させる

![](https://i.imgur.com/MXCeVns.jpeg)

![](https://i.imgur.com/m91vejB.jpeg)

- async letで、awaitでまとめて取り出すといい

![](https://i.imgur.com/J6v6oWw.jpeg)

![](https://i.imgur.com/E5wIv2v.jpeg)

名前を入れると認識してくれた

![](https://i.imgur.com/sPcZKgn.jpeg)

結果から見られる傾向

![](https://i.imgur.com/aKl8V5C.jpeg)

![](https://i.imgur.com/XSHmJ7s.jpeg)

## 20分トーク枠 Ockey   ## SwiftSyntaxとIndexStoreを組み合わせてSwiftコードベースの理解を深めるツールを開発しよう！

- [(72) SwiftSyntaxとIndexStoreを組み合わせてSwiftコードベースの理解を深めるツールを開発しよう！ @_ockey_ #1 day2 - YouTube](https://www.youtube.com/watch?v=_sTi_7Jq4zc)
- [SwiftSyntaxとIndexStoreを組み合わせてSwiftコードベースの理解を深めるツールを開発しよう！ | ドクセル](https://www.docswell.com/s/Ockey/K37D4M-extension_DC_Day2_Ockey)
- 難しいので流し見程度。
- `IndexStore`で呼び出しの依存関係が取れるくらいの認識

![](https://i.imgur.com/7TTvQqL.jpeg)

