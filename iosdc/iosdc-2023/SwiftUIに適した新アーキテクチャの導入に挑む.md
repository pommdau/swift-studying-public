# [SwiftUIに適した新アーキテクチャの導入に挑む](https://www.youtube.com/watch?v=y5vTTVvUejU&t=834s)

# 概要
- スライド
    - https://speakerdeck.com/ryunakayama/swiftuinishi-sitaxin-akitekutiyanodao-ru-nitiao-mu
- サンプル
    - https://github.com/chatwork/svvs-sample
    - (fork) https://github.com/pommdau/svvs-sample

# 所感

- MVVMのViewModelをViewStoreと呼ぶ

>https://x.com/koher/status/1503053256196444163
>![](https://i.imgur.com/b4iLtoU.jpeg)

- あとはStoreパターンを追加したくらいの理解で良さそうか

>https://x.com/koher/status/1698223218002403737
>![](https://i.imgur.com/ibO5CZI.jpeg)

- MVVMの描画周りの解決というのは、Store-ViewStateをCombineでリアクティブにしたことで解決したのだろう
- エラーハンドリングはViewState内で行う。
- 実際にやるならViewStateにエラー用のプロパティを持たせて、それをViewに反映させて表示するのでいけそう

>https://x.com/koher/status/1698225394397409481
>![](https://i.imgur.com/TLh2cqy.jpeg)

![](https://i.imgur.com/BTUwFo7.jpeg)

- ViewState -> Store -> Repository -> DataStoreの流れ
- ViewStateがRepositoryを持つより、こちらのほうがデータのフローが分かりやすくて良さそう

![](https://i.imgur.com/66dLiD9.jpeg)
- ViewStateとStoreのバインディングが参考になる
    - https://github.com/pommdau/svvs-sample/blob/main/SVVSSample/UserViewState.swift#L27-L39
- `UserStore`と`user`のバインディング

```swift
    init(id: User.ID) {
        self.id = id

        UserStore.shared.$values.map { $0[id] }.removeDuplicates().assign(to: &$user)
```

- `filteredFriends`のバインディング

```
•	$showsOnlyBookmarkedFriends: 「ブックマークされたフレンドのみを表示するか」のフラグ（Bool型）。
combineLatestは、これら3つのPublisherを監視し、いずれかが更新されたときに最新の値を結合して1つの値として出力します。
```

```swift
        $user
        .combineLatest(UserStore.shared.$values, $showsOnlyBookmarkedFriends)
        .map { user, users, showsOnlyBookmarkedFriends in
            guard let user else { return [:] }
            return OrderedDictionary(
                uniqueKeysWithValues: user.friendIDs.lazy
                    .compactMap { friendID in users[friendID] }
                    .filter { user in !showsOnlyBookmarkedFriends || user.isBookmarked }
                    .map { user in (user.id, user) }
            )
        }
        .removeDuplicates()
        .assign(to: &$filteredFriends)
```

# スクショ

![](https://i.imgur.com/vg5h3ad.jpeg)

![](https://i.imgur.com/bWyqWMS.jpeg)

![](https://i.imgur.com/wi4zZkX.jpeg)

![](https://i.imgur.com/tCmUoJf.jpeg)

![](https://i.imgur.com/rkhEzIp.jpeg)

![](https://i.imgur.com/y6LBXJd.jpeg)

![](https://i.imgur.com/WDxdgT0.jpeg)

![](https://i.imgur.com/IJNp5XY.jpeg)

![](https://i.imgur.com/Lf4NKHr.jpeg)

![](https://i.imgur.com/GOJSN97.jpeg)

![](https://i.imgur.com/fOuaybP.jpeg)

![](https://i.imgur.com/NIRB4UM.jpeg)

![](https://i.imgur.com/TWFw8bD.jpeg)

![](https://i.imgur.com/aGUoQiM.jpeg)

![](https://i.imgur.com/HJoh1sX.jpeg)

![](https://i.imgur.com/dn2Zp7T.jpeg)

![](https://i.imgur.com/2H9VHEt.jpeg)

![](https://i.imgur.com/fMBroci.jpeg)

![](https://i.imgur.com/NHziDuj.jpeg)

![](https://i.imgur.com/vjC8Mi7.jpeg)

![](https://i.imgur.com/n0pW06W.jpeg)

![](https://i.imgur.com/U5niHMn.jpeg)

![](https://i.imgur.com/hLRTYsB.jpeg)
