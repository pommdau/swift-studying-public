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
