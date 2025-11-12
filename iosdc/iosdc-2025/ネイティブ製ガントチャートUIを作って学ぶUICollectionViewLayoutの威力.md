# [iOSDC Japan 2025: ネイティブ製ガントチャートUIを作って学ぶUIColle… / 西 悠作 - YouTube](https://www.youtube.com/watch?v=8_9GmPn7URA)

![](https://i.imgur.com/qHPhxhv.jpeg)

![](https://i.imgur.com/GqzGmrk.jpeg)

UIScrollViewは不適

![](https://i.imgur.com/sGwlkyi.jpeg)

- UICollectionViewの利点
    - 必要なViewのみが表示される
    - View再利用がされる

![](https://i.imgur.com/o7AxFcL.jpeg)

![](https://i.imgur.com/iKyj9zb.jpeg)

![](https://i.imgur.com/J8ubTcU.jpeg)

![](https://i.imgur.com/3wzWS6u.jpeg)

![](https://i.imgur.com/a86EWhd.jpeg)

とりあえずダミーのレイアウト

![](https://i.imgur.com/JM0zqxJ.jpeg)

![](https://i.imgur.com/aLnUK0W.jpeg)

その後カスタムのレイアウトで置き換え
今はまだ何も表示されない

![](https://i.imgur.com/L0lng9N.jpeg)

![](https://i.imgur.com/h6d08wC.jpeg)

![](https://i.imgur.com/ZuTxbNO.jpeg)

セルの属性を設定するメソッド

![](https://i.imgur.com/U0xZklt.jpeg)

要素の配置が完了

![](https://i.imgur.com/83phTcP.jpeg)

CollectionViewのContentサイズが初期値のゼロなのでスクロールできない
なので下記メソッドで定義する

![](https://i.imgur.com/NnBBxaI.jpeg)

![](https://i.imgur.com/bmfgEWL.jpeg)

![](https://i.imgur.com/NcxTaHB.jpeg)

下記のようなキャッシュ用の処理をまとめると良い

![](https://i.imgur.com/B6wwjto.jpeg)

![](https://i.imgur.com/ZqEDIx4.jpeg)

`prepare()`に先程計算していた処理をいれて、ここから必要なセルを適宜取り出す

![](https://i.imgur.com/HHAZJZR.jpeg)

![](https://i.imgur.com/TchYnTQ.jpeg)

![](https://i.imgur.com/gQsxiff.jpeg)

日付けセルの始点終点のx座標を計算してキャッシュしたい

![](https://i.imgur.com/p4SUkCb.jpeg)

日付けでFrameを参照できるようにする

![](https://i.imgur.com/GZICzPg.jpeg)

![](https://i.imgur.com/kYtrwgX.jpeg)

![](https://i.imgur.com/RtVUTD5.jpeg)

色々計算した値をキャッシュしておいて、下記のように利用する

![](https://i.imgur.com/SgHC3w7.jpeg)

いい感じ！

![](https://i.imgur.com/CFDPbXP.jpeg)

![](https://i.imgur.com/XoqWtIV.jpeg)

![](https://i.imgur.com/i9poa5N.jpeg)

![](https://i.imgur.com/6SEJRUQ.jpeg)

先程同様にキャッシュさせる

![](https://i.imgur.com/lJ1nehP.jpeg)

![](https://i.imgur.com/ufS3F9Z.jpeg)

これで表示はOK
ただしPin留などができていない

![](https://i.imgur.com/5D8qdYs.jpeg)

日付け列のセパレータ

![](https://i.imgur.com/vRBA0br.jpeg)

indexPathによる内容の変更など柔軟なことはできないので、背景やセパレータなど静的に決まるものに利用できる

![](https://i.imgur.com/hlhqlqd.jpeg)

同様にキャッシュして利用
簡単に表示できる

![](https://i.imgur.com/qmeMt2D.jpeg)

![](https://i.imgur.com/3Jltbrm.jpeg)

![](https://i.imgur.com/5CvIjY8.jpeg)

下記をoverrideしてスクロールごとに再計算が起きるようにする
ただし計算が増えてしまうので、チューニングを行う必要はある(割愛)

![](https://i.imgur.com/O9EHeUG.jpeg)

`invalidateLayout`でレイアウトの再計算をさせる

![](https://i.imgur.com/xjqgXnI.jpeg)

![](https://i.imgur.com/ycuFR3o.jpeg)

![](https://i.imgur.com/q3PtWCp.jpeg)

時間割などできる

![](https://i.imgur.com/P13PWVj.jpeg)

![](https://i.imgur.com/8fK7Ihp.jpeg)



