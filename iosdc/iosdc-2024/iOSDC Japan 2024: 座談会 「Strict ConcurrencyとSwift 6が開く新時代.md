# [iOSDC Japan 2024: 座談会 「Strict ConcurrencyとSwift 6が開く新時代: 私たち… / shiz - YouTube](https://www.youtube.com/watch?app=desktop&v=IQtWiJMcFv0&ab_channel=iOSDCJapan)

- スライド
    - [座談会 「Strict ConcurrencyとSwift 6が開く新時代: 私たちはどう生きるか？」 by shiz | トーク | iOSDC Japan 2024 #iosdc - fortee.jp](https://fortee.jp/iosdc-japan-2024/proposal/5e7b95a8-9a2e-47d5-87a7-545c46c38b25)

![](https://i.imgur.com/V9737vl.jpeg)

![](https://i.imgur.com/MoJvZPZ.jpeg)

![](https://i.imgur.com/OvcfkZG.jpeg)

![](https://i.imgur.com/o7EEz6m.jpeg)

![](https://i.imgur.com/NsdpAbq.jpeg)

![](https://i.imgur.com/oFsvvhJ.jpeg)

![](https://i.imgur.com/QsaOPsw.jpeg)

![](https://i.imgur.com/DVfwJR5.jpeg)

![](https://i.imgur.com/Wna83Lv.jpeg)

![](https://i.imgur.com/rXlLVKn.jpeg)

![](https://i.imgur.com/2tq88qk.jpeg)

![](https://i.imgur.com/qJIcoAm.jpeg)

![](https://i.imgur.com/oDqDnyx.jpeg)

![](https://i.imgur.com/VOSWFTn.jpeg)

![](https://i.imgur.com/ysmdwUr.jpeg)

![](https://i.imgur.com/up78Ste.jpeg)

不必要にMainActor外で扱っているものを、MainActor isolatedにすることで複雑さを抑えることができそう

![](https://i.imgur.com/1BgciTi.jpeg)

FPS1/60内で終わる処理ならメインスレッドで行っても大丈夫
せいぜいViewで扱うのは数百件程度だろう

![](https://i.imgur.com/nTQr4WE.jpeg)

![](https://i.imgur.com/XRTjuN2.jpeg)

![](https://i.imgur.com/WX0HAsF.jpeg)

![](https://i.imgur.com/sbnmEsU.jpeg)

![](https://i.imgur.com/ZNaZnHe.jpeg)

![](https://i.imgur.com/fUuxos4.jpeg)

![](https://i.imgur.com/QIDATYv.jpeg)

![](https://i.imgur.com/PHlFOq6.jpeg)

基本4の`@unchecked Sendable`まではいくことはないだろう

![](https://i.imgur.com/BBstkfe.jpeg)

![](https://i.imgur.com/PkiDOKj.jpeg)

![](https://i.imgur.com/aeV7q1Z.jpeg)

![](https://i.imgur.com/jmvwGuD.jpeg)

[事例別！Strict Concurrency対応方法](https://zenn.dev/matsuji/articles/99fd796f8e405a)

![](https://i.imgur.com/EpywPjr.jpeg)

[Code search results](https://github.com/search?q=repo%3Aswiftlang%2Fswift%20%22Sending%20%27self%27%20risks%20causing%20data%20races%22&type=code)

![](https://i.imgur.com/RpHad8I.jpeg)
![](https://i.imgur.com/PJLIXWX.jpeg)
