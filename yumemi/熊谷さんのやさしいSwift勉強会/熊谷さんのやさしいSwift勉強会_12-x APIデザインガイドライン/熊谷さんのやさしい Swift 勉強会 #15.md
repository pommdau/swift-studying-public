# [熊谷さんのやさしい Swift 勉強会 \#15](https://www.youtube.com/watch?v=YshUCzFpBqk&ab_channel=ChannelYumemi)
# 参考
- 資料: https://assets.super.so/df290f98-2de3-4caa-9480-2e9e2082cb4f/files/f175bb3d-3d80-4dd7-ada7-1dec032d3aaa.pdf

# Memos
- 標準ライブラリもたまにブレがち…？

![image](https://i.imgur.com/QOC3R1e.png)

- 説明として分かるのが大切

![image](https://i.imgur.com/dF3jpRv.png)

- 主体にならない引数 => Optionalか否かで決めても良い
- `havingOptions`とかは不適当

![image](https://i.imgur.com/ZjNZ1uL.png)

![image](https://i.imgur.com/fNbIh0n.png)

![image](https://i.imgur.com/dMt9ATB.png)

- 第一引数に限らず前置詞はつかない

![image](https://i.imgur.com/bjHbah8.png)

- もしメソッド名なら、`colorHaving`のように前置詞を外に出す。

![image](https://i.imgur.com/WkOF3ap.png)

- `print(x)`は副作用を持つ(コンソールに出力するのは副作用)

![image](https://i.imgur.com/qrMOzWY.png)

- arryaではなくindexに対して副作用がある、なのでformをつける

![image](https://i.imgur.com/4npgkUo.png)

- Swift2ではsortがsorted相当の動きをしていた

![image](https://i.imgur.com/j1pwcgc.png)