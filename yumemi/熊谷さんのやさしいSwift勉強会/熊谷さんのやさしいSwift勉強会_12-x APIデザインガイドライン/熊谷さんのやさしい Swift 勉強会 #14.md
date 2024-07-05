# 熊谷さんのやさしい Swift 勉強会 #14
- https://www.youtube.com/watch?v=hh7Pru_nFqQ&ab_channel=ChannelYumemi

# Memos

![image](https://i.imgur.com/YVV1eUc.png)

- `add`だけだと何をしたいのかが良くわからない
- `for`だけだと何を渡すのかが分からないので、`forKeyPath`として役割を付け加える

![image](https://i.imgur.com/Z1S2Q4K.png)

- 下記のような感覚
    - unsafeBitCastに対してtoが主体
    - userDefaultsに対してkeyは主体じゃないので名詞を添える
    - gridに対してkeyPathは主体じゃないので名詞を添える

![image](https://i.imgur.com/8QKwKIR.png)

![image](https://i.imgur.com/aK0MGdY.png)

- SwiftUIで両方ある問題
- SwiftUIはガイドラインに則していないかも。

![image](https://i.imgur.com/Z7bHz3d.png)

- `accessibilityHint`は将来Deprecateになる？

![image](https://i.imgur.com/MgYObH1.png)

# 雑まとめ

```
- add(_ hoge: Hoge) or addHoge()問題。型というよりは主体かどうかが大事そう。
- またadd(hoge: Hoge)のようなラベルは使わない。恐らくObjcの文化からきている。
```