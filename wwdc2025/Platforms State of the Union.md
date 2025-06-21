# [Platforms State of the Union - WWDC25 - ビデオ - Apple Developer](https://developer.apple.com/jp/videos/play/wwdc2025/102/)

# 要約
- [Gemini](https://gemini.google.com/app/79bef28a661aace3?hl=ja)

この動画は、WWDC25でのプラットフォームの現状と、開発者向けの新しい機能、API、テクノロジーについてまとめたものです。

主な内容は以下の通りです。

* **Appleのプラットフォーム基盤** \[[00:36](http://www.youtube.com/watch?v=51iONeETSng&t=36)\]
    * Appleシリコンによる優れたパフォーマンスと効率性。
    * Metal、Apple Intelligence、Swift、Swift UIといったソフトウェア技術が基盤を強化。
    * プライバシー、アクセシビリティ、国際化がアプリに組み込まれ、幅広いユーザーが利用可能。
    * iCloud、CloudKit、ウィジェット、Live Activitiesなどの高レベルAPIにより、アプリのデバイス間連携が強化。

* **新しいUIデザイン「Liquid Glass」** \[[02:45](http://www.youtube.com/watch?v=51iONeETSng&t=165)\]
    * 2025年の最も広範なデザインアップデートであり、ソフトウェアデザインの次世代を定義。
    * ガラスの光学特性と応答性の高い流動性を組み合わせることで、奥行きと活力を実現。
    * コンテンツを優先し、UIは必要な時に表示され、それ以外は背景に溶け込む設計。
    * Universal Design Languageにより、プラットフォーム間での一貫性と調和を提供。
    * 開発者は、階層の確立、調和の作成、一貫性の維持という3つの原則を考慮してアプリに適用可能。
    * 新しいAPIにより、既存のアプリのビューが自動的に更新され、Liquid Glassの見た目に適応。
    * アイコンもLiquid Glassデザインに対応し、レイヤー、ハイライト、透明度を調整できる新しいツール「Icon Composer」が導入。

* **Apple Intelligenceと機械学習** \[[19:20](http://www.youtube.com/watch?v=51iONeETSng&t=1160)\]
    * iOSのコアに組み込まれたパーソナルインテリジェンスシステムで、Writing Tools、Genmoji、Image Playgroundなどの機能を提供。
    * Foundation Modelsフレームワークを介して、デバイス上の基盤モデルに直接アクセス可能。
    * モデルは、テキスト抽出、要約などのタスクに対応し、高いパフォーマンスとプライバシーを確保。
    * Guided Generationにより、モデルが構造化されたレスポンスを生成し、Tool Calling機能でモデルがタスクに必要な情報を取得したり、アクションを実行したりできる。
    * CoreML、Speech API、MLXなどの既存の機械学習APIも引き続き利用可能。
    * App Intentsフレームワークにより、アプリの機能をシステム全体に公開し、Siri、ショートカット、Spotlightから利用可能に。

* **開発ツールと言語の進化** \[[28:41](http://www.youtube.com/watch?v=51iONeETSng&t=1721)\]
    * **Xcode 26**:
        * 予測コード補完が改善され、より正確で最適化されたコンテキスト収集が可能に。
        * Chat GPTがXcodeにシームレスに統合され、自然言語でコードと対話可能に。
        * Coding Tools、Playgroundマクロ、ドキュメント生成、エラー修正、会話履歴など、生産性を向上させる新機能。
        * 複数のプロバイダーのモデル（Anthropicなど）をサポートし、ローカルでのモデル実行も可能。
        * タブエクスペリエンスの再設計、音声制御の改善、ローカライズの自動化などの機能強化。
    * **Swift 6.2**:
        * パフォーマンス向上のためのInline ArraysとSpan型を導入。
        * C言語との相互運用性の改善により、より安全で使いやすいインターフェースを提供。
        * C++相互運用性の向上と、Java、JavaScript、WebAssemblyとの連携を強化。
        * 並行処理コードをより安全にするSwift 6言語モードを拡張し、シングルスレッドコードの記述を簡素化。
        * サーバーサイドSwift開発を支援する新しいフレームワークとツール「Containerization」を導入。

* **SDKの改善と新しい体験** \[[40:48](http://www.youtube.com/watch?v=51iONeETSng&t=2448)\]
    * **Swift UI**:
        * 新しいWeb APIにより、アプリへのウェブコンテンツの埋め込みが容易に。
        * リッチテキスト編集機能、3Dチャートのサポート、パフォーマンスの向上が含まれる。
        * リストやテーブルのスクロールパフォーマンスが大幅に向上し、Macでもアイドルプリフェッチが利用可能に。
        * Swift Dataの柔軟性が向上し、ウィジェットのプッシュ通知、ドラッグ＆ドロップの制御が強化。
    * **Vision OS 26**:
        * 新しいVolumetric API、高度な共有機能、没入型メディアツール、強力なエンタープライズ機能。
        * Swift UI、Reality Kit、ARKitの統合が深化し、3Dコンテンツの配置と変換が容易に。
        * Nearby Window Sharingによる共有空間体験、SharePlay APIの強化、共有ワールドアンカーのサポート。
        * アプリとQuickBookコンテンツの永続化、Widget Kitフレームワークの拡張。
        * Reality KitのImage Presentationコンポーネントにより、2D画像を3D空間シーンに変換可能に。
        * 180°/360°/広視野角ビデオのサポート、Apple Immersive Videoコンテンツの再生。
        * エンタープライズ向けの機能として、コンテンツキャプチャの無効化、ユーザー位置追跡、カメラフィードへのアクセスなどが可能に。
    * **ゲーム開発**:
        * Metal 4の導入により、ニューラルレンダリング、Metal Effectsアップスケーリング、フレーム補間、デノイジングなど、高度なグラフィックス技術をサポート。
        * Game Porting Toolkitが改良され、WindowsゲームのAppleプラットフォームへの移植が容易に。
        * PlayStation DualSenseコントローラーのペアリング、新しいタッチコントローラーAPI、Vision Proでのより高速なハンドトラッキングなど、入力機能の強化。
        * 新しいGame SaveフレームワークとGame Center Challenges APIにより、クラウドセーブとソーシャルなゲーム体験を提供。
        * macOS Tahoeでのゲーム向け低電力モードの最適化。

* **Intel Macのサポート終了** \[[54:20](http://www.youtube.com/watch?v=51iONeETSng&t=3260)\]
    * macOS TahoeがIntel Mac向けの最終リリースとなり、開発者にはApple Silicon版への移行が推奨される。

この動画は、Appleプラットフォームでのアプリ開発における、Liquid Glassによるデザイン、Apple IntelligenceによるAI機能、XcodeとSwiftの進化、そしてSwift UI、Vision OS、ゲーム開発の新しい可能性について、広範かつ詳細に説明しています。

# Liquid Glassの概要

- 新しいデザインの中心は見た目だけでなくInteractivityである
- ガラスの下とのコンテンツの関係が維持される
- 以下デザインするにあたって大事なこと3つ

![](https://i.imgur.com/jYmxAZ3.jpeg)

- タブバーを分離するなど、アプリのコンテンツがよりスペースを使えるようになった

![](https://i.imgur.com/gt0BRZj.jpeg)

- 下記にすることで、隅々までコンテンツを表示できる

![](https://i.imgur.com/L2hparp.jpeg)

Liquid Glassにはカスタムカラーも可能

![](https://i.imgur.com/w3VmlfA.jpeg)

コントロールが浮き上がり、より階層構造が明確になる
今までの感覚に加えて、新しい感覚が同居することになる

![](https://i.imgur.com/ozvphXi.jpeg)

2つめはハーモニー

![](https://i.imgur.com/XLR9rZJ.jpeg)

UI要素の形は現在のデバイスの形状に基づく

![](https://i.imgur.com/nCzADAk.jpeg)

タイポグラフィも変更されている
大きくても目立つタイポグラフィとなり左揃えとなった

![](https://i.imgur.com/3sJ2uPd.jpeg)

![](https://i.imgur.com/wP6Tmvz.jpeg)

# 新しいデザインの適用
- まず再コンパイルしてコードが変更されていない状態を確認
- 次に新しいAPIをつかってアプリのデザインを調整
- 最後に新しいHIGとLiquid Glassを使ってアップデート

![](https://i.imgur.com/qNsIGEc.jpeg)

Recompileした場合
TabViewなどは自動でLiquid Glassが採用される

![](https://i.imgur.com/F78j6bG.jpeg)

![](https://i.imgur.com/TrGUmSw.jpeg)

![](https://i.imgur.com/L5037Gy.jpeg)

![](https://i.imgur.com/poGWEsa.jpeg)

![](https://i.imgur.com/qqdEFZM.jpeg)

[Destination Video | Apple Developer Documentation](https://developer.apple.com/documentation/visionos/destination-video)

![](https://i.imgur.com/WK85wRz.jpeg)

![](https://i.imgur.com/65QuJui.jpeg)


![](https://i.imgur.com/uM2jULV.jpeg)

コンテンツのデフォルトはモノクロだが、スタイルを設定できる

![](https://i.imgur.com/ZFJKAAM.jpeg)

![](https://i.imgur.com/NROvXwL.jpeg)

![](https://i.imgur.com/MAPVUfF.jpeg)

スクロールすると小さくなる

![](https://i.imgur.com/5ZpYAoS.jpeg)

![](https://i.imgur.com/Bkm0soO.jpeg)

- landmarkアプリでの実践
- セーフエリアの拡張

![](https://i.imgur.com/bH7egJ1.jpeg)

セクションを分ける例

![](https://i.imgur.com/zWcxT5B.jpeg)

![](https://i.imgur.com/hw5UgFk.jpeg)

![](https://i.imgur.com/6waJAX4.jpeg)

![](https://i.imgur.com/EBc0Gz3.jpeg)

![](https://i.imgur.com/Pc0PRQh.jpeg)

# アプリアイコンの刷新

従来のフルカラーモード

![](https://i.imgur.com/hS2dZDz.jpeg)

![](https://i.imgur.com/hsOR4ri.jpeg)

従来のカラーモード

![](https://i.imgur.com/NZVDgdR.jpeg)

![](https://i.imgur.com/9xGRU22.jpeg)

クリアモードが追加

![](https://i.imgur.com/smRUVsN.jpeg)

![](https://i.imgur.com/dFiN2eW.jpeg)

![](https://i.imgur.com/ErGjRLi.jpeg)

![](https://i.imgur.com/ySd1JXj.jpeg)

![](https://i.imgur.com/bFrvtaV.jpeg)

Xcode16でビルドした場合は、新OSでも従来の見た目になる

![](https://i.imgur.com/crDZnKl.jpeg)

Xcode26で再ビルドすると自動で適用される

![](https://i.imgur.com/Q14cYxf.jpeg)

新デザインの考慮時間のため従来の見た目にするオプションも残すが、次のメジャーアップデートで終了する予定

# Apple Intelligence

![](https://i.imgur.com/bZZCZ9j.jpeg)

![](https://i.imgur.com/BoWQVN9.jpeg)

 ![](https://i.imgur.com/s6sEfJV.jpeg)

![](https://i.imgur.com/qXPWhDh.jpeg)

![](https://i.imgur.com/T73V8KP.jpeg)

![](https://i.imgur.com/w2IIvvs.jpeg)

![](https://i.imgur.com/s0s6QQi.jpeg)

![](https://i.imgur.com/HVjrvDp.jpeg)

![](https://i.imgur.com/oNKSw9O.jpeg)

`@Generable`で出力するデータ構造を指定できる
これによりアプリの独自機能の開発に注力できる

![](https://i.imgur.com/QRxGhH9.jpeg)

![](https://i.imgur.com/zkN0bVl.jpeg)

![](https://i.imgur.com/0tVOhLb.jpeg)

![](https://i.imgur.com/KYyfzSh.jpeg)

![](https://i.imgur.com/abRhI5m.jpeg)

![](https://i.imgur.com/thE5B2D.jpeg)

`@Guide`によりプロパティの詳細を指定できる

![](https://i.imgur.com/UeVTSqF.jpeg)

![](https://i.imgur.com/3vKrtS3.jpeg)

![](https://i.imgur.com/HTy82Uj.jpeg)

![](https://i.imgur.com/FAP6IWj.jpeg)

![](https://i.imgur.com/yaqpO5P.jpeg)

LLMなどの開発にMLXが利用できる？

![](https://i.imgur.com/JCu6jTm.jpeg)

# App Intent

- macOSのSpotlightからアクセスできる
- 画像検索の話

![](https://i.imgur.com/g9T7gei.jpeg)

![](https://i.imgur.com/BI2WQtC.jpeg)

![](https://i.imgur.com/euurNie.jpeg)

![](https://i.imgur.com/Amh9QXP.jpeg)

![](https://i.imgur.com/2Mko4GX.jpeg)

![](https://i.imgur.com/Miazo7t.jpeg)

画像でイメージを伝えることもできる

![](https://i.imgur.com/AhEYdn4.jpeg)

![](https://i.imgur.com/RB9zRne.jpeg)

コード・ドキュメントが作成できる

![](https://i.imgur.com/MhoTsrt.jpeg)

![](https://i.imgur.com/ui1eUoS.jpeg)

会話の履歴をスライダーで操作して、もとのコードに戻すことができる

![](https://i.imgur.com/MdgjDDb.jpeg)

![](https://i.imgur.com/z5lojml.jpeg)

好きなモデルを追加できる

![](https://i.imgur.com/m0aJ03F.jpeg)

音声でコーディングもできる

![](https://i.imgur.com/ecB23sP.jpeg)

翻訳のコメントの自動生成もできる

![](https://i.imgur.com/fjwFNEp.jpeg)

# Swift6.2

![](https://i.imgur.com/qwGA0dj.jpeg)

配列の要素を決めることで、よりパフォーマンスを出せる
ヒープメモリを使う必要がない

![](https://i.imgur.com/KgyUVll.jpeg)

Span型
Cなどと連携してメモリセーフにアクセスできる？

![](https://i.imgur.com/Tn6TiPM.jpeg)

![](https://i.imgur.com/aeTjQwp.jpeg)

![](https://i.imgur.com/6uydEQV.jpeg)

C++のコードをSwiftから呼び出せるようになった

![](https://i.imgur.com/sNHFN8x.jpeg)

![](https://i.imgur.com/TUqJ5Oe.jpeg)

- `@concurrent`の話
- [@concurrent explained with code examples - SwiftLee](https://www.avanderlee.com/concurrency/concurrent-explained-with-code-examples/)
- [Swift 6.2 と Xcode 26 で変わる並行処理と新たなビルド設定 nonisolated(nonsending) By Default について #iOS - Qiita](https://qiita.com/1plus4/items/8c2b484977a150b32117)

![](https://i.imgur.com/uarxFdB.jpeg)

# サーバの話

![](https://i.imgur.com/eJ5Q6H8.jpeg)

![](https://i.imgur.com/ZVLTJlf.jpeg)

![](https://i.imgur.com/6jhM3i6.jpeg)

# SwiftUI

![](https://i.imgur.com/niKa1gj.jpeg)

![](https://i.imgur.com/6XhiP7Y.jpeg)

![](https://i.imgur.com/RExoPLP.jpeg)

![](https://i.imgur.com/KwrsJlG.jpeg)

![](https://i.imgur.com/ZMzm75R.jpeg)

![](https://i.imgur.com/kcu2KxQ.jpeg)

![](https://i.imgur.com/43Stm2P.jpeg)

![](https://i.imgur.com/ovGl0X1.jpeg)

![](https://i.imgur.com/SrjVXR6.jpeg)

![](https://i.imgur.com/dmRZijq.jpeg)

![](https://i.imgur.com/r53eit3.jpeg)

![](https://i.imgur.com/F82OyF7.jpeg)

![](https://i.imgur.com/gVYNqSH.jpeg)

![](https://i.imgur.com/GZtANnD.jpeg)

# VisionOS26

![](https://i.imgur.com/k4hTbXD.jpeg)

![](https://i.imgur.com/dyQhOkR.jpeg)

![](https://i.imgur.com/8p1on8s.jpeg)

![](https://i.imgur.com/6Qmtx80.jpeg)

![](https://i.imgur.com/tIiuMRd.jpeg)

[SharePlayを使用してiPhoneのFaceTimeで一緒に視聴したりプレイしたりする - Apple サポート (日本)](https://support.apple.com/ja-jp/guide/iphone/iphb657eb791/ios)

![](https://i.imgur.com/mFa3IuP.jpeg)

![](https://i.imgur.com/i4zh8aH.jpeg)

Widgetを作れるようになった

![](https://i.imgur.com/2oZlub2.jpeg)

2D写真からAIで3D化できる

![](https://i.imgur.com/YTXVCjP.jpeg)

![](https://i.imgur.com/lcPOo20.jpeg)

![](https://i.imgur.com/hbshaau.jpeg)

![](https://i.imgur.com/4AppLB2.jpeg)

![](https://i.imgur.com/bY2KkMZ.jpeg)

# Game

![](https://i.imgur.com/Ac8lTp9.jpeg)

![](https://i.imgur.com/m2iwEHY.jpeg)

![](https://i.imgur.com/MAZbRjD.jpeg)

# その他

![](https://i.imgur.com/jsgZwXZ.jpeg)

![](https://i.imgur.com/d6QpwYi.jpeg)

目線でブラウジングできる

![](https://i.imgur.com/qBdCZ9c.jpeg)

年齢設定をしてアプリの体験をカスタムできる

![](https://i.imgur.com/kkWJlIY.jpeg)

![](https://i.imgur.com/xt1uF0Y.jpeg)
