# [Write Swift macros](https://developer.apple.com/videos/play/wwdc2023/10166/)

![](https://i.imgur.com/lreJC0w.jpeg)

![](https://i.imgur.com/kNMtM4B.jpeg)

![](https://i.imgur.com/vHOc8gL.jpeg)
![](https://i.imgur.com/5xAraFF.jpeg)
![](https://i.imgur.com/bWzNWFT.jpeg)
![](https://i.imgur.com/wSXXQkf.jpeg)
![](https://i.imgur.com/3Nzda5u.jpeg)
![](https://i.imgur.com/Aa8ZMN9.jpeg)
![](https://i.imgur.com/6kC9ad4.jpeg)
- 新規作成でPackageを選択

![](https://i.imgur.com/UBNaqQa.jpeg)
![](https://i.imgur.com/9jEBH4k.jpeg)
- `StringfyMacroはExpressionMacroに準拠
- 要件は…expansion関数
    - `node`: マクロ式の構文Tree
    - `context`: コンパイラとの通信に使用できるコンテキスト
    - `return`するのは書き換えた構文

![](https://i.imgur.com/E3dJ7J6.jpeg)
- `argument`は単一のものを想定

![](https://i.imgur.com/iwYrht7.jpeg)

![](https://i.imgur.com/W2sPHIP.jpeg)
![](https://i.imgur.com/YfLkvmv.jpeg)
![](https://i.imgur.com/vKo0Vpb.jpeg)
- 他のにMacrosに関しては[Expand on Swift macros](https://developer.apple.com/videos/play/wwdc2023/10167/)を参照

![](https://i.imgur.com/dHwHJn4.jpeg)
- `@Attached`について見ていく

![](https://i.imgur.com/FxmDnF6.jpeg)
![](https://i.imgur.com/zPwOUFe.jpeg)

- `@attached`の`names`に追加したい関数名の`init`を宣言

![](https://i.imgur.com/aD3YT0J.jpeg)
- 先ほどと同様に`expansion`の実装が必要

![](https://i.imgur.com/Hr2QOG5.jpeg)
![](https://i.imgur.com/vubaC2t.jpeg)

- 今は何もしないのでテスト結果もダミーとしておく

![](https://i.imgur.com/ieHrAcv.jpeg)
- 期待する結果をとりあえず入れておく

![](https://i.imgur.com/ifSPEuU.jpeg)
- enumにのみ適用できるようにしておく

![](https://i.imgur.com/EJTNzjh.jpeg)
![](https://i.imgur.com/3t1FpLN.jpeg)
![](https://i.imgur.com/M49GBq5.jpeg)
![](https://i.imgur.com/Eet8K2o.jpeg)
![](https://i.imgur.com/HYJW5ZG.jpeg)
![](https://i.imgur.com/2UgpmdF.jpeg)
![](https://i.imgur.com/1ThB8zF.jpeg)
- Add Packageでローカルのものを指定することで、任意のプロジェクトで利用できる

![](https://i.imgur.com/IxhqgkZ.jpeg)
![](https://i.imgur.com/HIky8VD.jpeg)

![](https://i.imgur.com/aw8zjlo.jpeg)
![](https://i.imgur.com/oKI2X1A.jpeg)
- enumで`SlopSubsetError`を宣言

![](https://i.imgur.com/MPhWyE1.jpeg)
- 下記でwarningやfix itが作れるみたい

![](https://i.imgur.com/7kkeNIy.jpeg)
![](https://i.imgur.com/zAar6s6.jpeg)
![](https://i.imgur.com/0rRVXwG.jpeg)
- Genericsで汎用の方で使えるようにする

![](https://i.imgur.com/DKfFHt2.jpeg)
- Genericsのパラメータを取得

![](https://i.imgur.com/QlKBt0p.jpeg)
![](https://i.imgur.com/tkjDzNF.jpeg)
![](https://i.imgur.com/JFsY2Vp.jpeg)
