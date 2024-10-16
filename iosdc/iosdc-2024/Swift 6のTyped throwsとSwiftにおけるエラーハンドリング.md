# Swift 6のTyped throwsとSwiftにおけるエラーハンドリング

- 動画
    - [iOSDC Japan 2024: Swift 6のTyped throwsとSwiftにおけるエラーハンドリング… / koher](https://www.youtube.com/watch?v=YtRra0lVaBA&ab_channel=iOSDCJapan&loop=0)
- スライド
    - [Swift 6のTyped throwsとSwiftにおけるエラーハンドリングの全体像を学ぶ](https://speakerdeck.com/koher/swift-6notyped-throwstoswiftniokeruerahandoringunoquan-ti-xiang-woxue-bu?slide=53)

## メモ
- 基本的にTyped Throwsは使わない
- asyncのメソッドの場合もTaskのCancellationErrorの可能性があるので不適切
- ユースケースは閉じたパッケージやmapなどのジェネリックなパラメータを取る関数を自作しているときなど

![](https://i.imgur.com/SjKpmDJ.jpeg)

- エラーハンドリングの使い分け
- この辺は理解しているつもりなのでOK

<img width="943" alt="image" src="https://github.com/user-attachments/assets/d7a437a2-be10-4aff-a0eb-02e7d5812b0b">
