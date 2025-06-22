# [What’s new in SwiftUI](https://www.youtube.com/watch?v=cETgTtu6atM)

## Geminiまとめ
この動画は、SwiftUIの最新機能と改善点を紹介しています。

**主な内容:**

* **新しいデザインシステム** [01:24]: アプリ全体で一貫性のある、明るく流動的なユーザーエクスペリエンスを実現します。iPadとmacOSのサイドバーのガラスのような外観、iPhoneのよりコンパクトなタブバー、液体ガラスのツールバーアイテムなどが含まれます。
* **強化されたインタラクション** [05:07]:
    * **メニューバー** [05:12]: iPadで一般的なアクションに素早くアクセスできるようになりました。
    * **ウィンドウのリサイズ** [05:40]: iPadではアプリを柔軟にリサイズでき、macOSではコンテンツビューのサイズ変更によるアニメーションが同期されるようになりました。
* **SwiftUIの基盤の改善** [07:00]:
    * **パフォーマンスの向上** [07:18]: リストの読み込みと更新が高速化され、特にmacOSで顕著です。スクロール時のUI更新のスケジューリングが改善され、フレーム落ちが減少しました。
    * **並行処理** [10:18]: Swiftの構造化された並行処理のサポートにより、コンパイル時にデータ競合の安全性が検証されます。
    * **アニメーション** [10:58]: `animatable` マクロと `animatableIgnored` マクロにより、カスタムアニメーションデータの宣言が簡素化されました。
    * **レイアウト** [11:47]: 3Dレイアウトのための新しいデプスベースのモディファイアが追加され、VisionOSでの空間的なオーバーレイ配置などが可能です。
    * **操作可能なモディファイア** [13:00]: アプリ内のオブジェクトを操作できるようになり、水筒のモデルを掴んで移動させる例が示されています。
* **システム全体でのSwiftUIの活用** [14:30]:
    * **シーンのブリッジング** [15:07]: UIキットおよびAppKitのライフサイクルアプリからSwiftUIシーンをリクエストできるようになりました。
    * **リモートイマーシブスペース** [15:45]: macOSアプリがApple Vision Proでステレオコンテンツをレンダリングできる新しいシーンタイプです。
    * **アクセシビリティ** [16:31]: アシストアクセスシーンタイプにより、認知障害のあるユーザー向けにUIを表示できます。
    * **RealityKitとの連携強化** [17:20]: RealityKitエンティティが`Observable`に準拠し、座標変換APIが改善され、RealityKitからSwiftUIのポップオーバーを表示できるようになりました。
    * **カスタムコントロール** [18:31]: WatchOSとmacOSで利用可能になり、コントロールセンターやウォッチからアクセスできます。
    * **ウィジェット** [19:12]: VisionOSとCarPlayに導入され、新しい詳細度環境値やライブアクティビティ、プッシュベースの更新APIなどが追加されました。
* **ビュー機能の拡張** [20:06]:
    * **WebKitのSwiftUI API** [20:16]: `WebView`ビューが追加され、アプリ内でウェブコンテンツを表示したり操作したりできるようになりました。
    * **3Dチャート** [21:23]: `Chart3D`ビューにより、3次元でのプロットが可能になります。
    * **ドラッグ＆ドロップ** [22:08]: 複数のアイテムのドラッグ、ドラッグコンテナモディファイア、ドラッグ設定API、ドラッグセッション更新モディファイア、ドラッグプレビューの形成などが強化されました。
    * **リッチテキスト編集** [23:44]: `TextEditor`が`AttributedString`をサポートし、組み込みのテキスト書式設定コントロールを使用してリッチテキストでコメントを記述できるようになりました。

## 00:00 - Introduction
## 01:22 - Make the new design shine

![](https://i.imgur.com/Z4HSsQP.jpeg)

![](https://i.imgur.com/9YIp82U.jpeg)

色を付けられる

![](https://i.imgur.com/lNc46mN.jpeg)

スクロール時にバーの下のコンテンツの存在をユーザに感じてもらうことができる

![](https://i.imgur.com/DbcI9jq.jpeg)

`.seachable`が下に配置されるようになった、より人間工学的

![](https://i.imgur.com/GmsXLxk.jpeg)

iPadでは右上

![](https://i.imgur.com/5B5QFA6.jpeg)

検索にTabをもつ場合

![](https://i.imgur.com/mctyLXI.jpeg)

roleを設定して、伸び縮みするようになる

![](https://i.imgur.com/NM8ZEdy.jpeg)

システム全体のコントロールが刷新

![](https://i.imgur.com/aq6w6Sa.jpeg)

![](https://i.imgur.com/ezULuP9.jpeg)

![](https://i.imgur.com/OAbujLO.jpeg)

![](https://i.imgur.com/eqmeIxh.jpeg)

![](https://i.imgur.com/priEGGC.jpeg)

iPadにメニューバー

![](https://i.imgur.com/nV0n4LT.jpeg)

![](https://i.imgur.com/AJHGKJm.jpeg)

iPadのウインドウサイズが可変に
SplitViewの場合は列の表示/非表示が切り替わる

![](https://i.imgur.com/JAdSUid.jpeg)

![](https://i.imgur.com/gimzmhp.jpeg)

下記がDeprecatedになる

![](https://i.imgur.com/cXoDl00.jpeg)

![](https://i.imgur.com/VXGMeDC.jpeg)

macOSでもウインドウ変更用の指定ができる？

![](https://i.imgur.com/UApfQb0.jpeg)

(幅が変わるので微妙な気はする)

![](https://i.imgur.com/zqQghph.jpeg)

## 06:59 - Framework foundations

![](https://i.imgur.com/WK7zexu.jpeg)

![](https://i.imgur.com/lrXrkQt.jpeg)

下記のパフォーマンスが向上

![](https://i.imgur.com/mtKNETP.jpeg)

![](https://i.imgur.com/Qm5tt6x.jpeg)

![](https://i.imgur.com/CbGJozy.jpeg)

ScrollVIewの中の`LazyVStack`は遅延してコンテンツを表示しているが、
`LazyHStack`も同様の動きになった

![](https://i.imgur.com/FQeFFKk.jpeg)

パフォーマンスの問題を確認できる

![](https://i.imgur.com/Q52CZor.jpeg)

![](https://i.imgur.com/hJcibGb.jpeg)

![](https://i.imgur.com/1kX6eUE.jpeg)

![](https://i.imgur.com/qXOoXSj.jpeg)

![](https://i.imgur.com/tASNL7i.jpeg)

![](https://i.imgur.com/2aVfQm1.jpeg)

![](https://i.imgur.com/n0z5mgI.jpeg)

![](https://i.imgur.com/GeVaPMj.jpeg)

![](https://i.imgur.com/6oBKsOI.jpeg)

![](https://i.imgur.com/ERVtDLk.jpeg)

![](https://i.imgur.com/KSdvyDK.jpeg)

![](https://i.imgur.com/cIHVyAh.jpeg)

## 14:33 - SwiftUI across the system

![](https://i.imgur.com/RgB3rYk.jpeg)

![](https://i.imgur.com/mtU1jI2.jpeg)

iPhoneでアシスティブアクセス機能

![](https://i.imgur.com/0F7wE7E.jpeg)

![](https://i.imgur.com/eDqLfxl.jpeg)

![](https://i.imgur.com/pIyXQ8g.jpeg)

![](https://i.imgur.com/gCVknRG.jpeg)

![](https://i.imgur.com/kaqyfT1.jpeg)

![](https://i.imgur.com/6KmuM3Y.jpeg)

ControlCenterがmacOSとwatchOSに登場

![](https://i.imgur.com/NNsGDCH.jpeg)

![](https://i.imgur.com/ETnNfWA.jpeg)

![](https://i.imgur.com/hpyUIB8.jpeg)

![](https://i.imgur.com/HGupV4H.jpeg)

![](https://i.imgur.com/LJ3sPv5.jpeg)

![](https://i.imgur.com/51im8cv.jpeg)

## 20:04 - Expand SwiftUI views

![](https://i.imgur.com/kZHUpC0.jpeg)

![](https://i.imgur.com/KgGk6Nd.jpeg)

![](https://i.imgur.com/FnkD1Zz.jpeg)

![](https://i.imgur.com/4JZZ15u.jpeg)

![](https://i.imgur.com/JqXzWVZ.jpeg)

ドラッグアンドドロップの機能が強化

![](https://i.imgur.com/cOTEC5m.jpeg)

![](https://i.imgur.com/5m0aic2.jpeg)

ドラッグ時の見た目のカスタマイズのmodifier

![](https://i.imgur.com/AxTvFQh.jpeg)

![](https://i.imgur.com/BfoKg8I.jpeg)

![](https://i.imgur.com/nOymwRj.jpeg)

## 25:01 - Next steps

![](https://i.imgur.com/XAeAZmM.jpeg)

![](https://i.imgur.com/zitLMlE.jpeg)
