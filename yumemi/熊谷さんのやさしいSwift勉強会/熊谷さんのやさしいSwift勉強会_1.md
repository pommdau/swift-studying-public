# [熊谷さんのやさしい Swift 勉強会 \#1](https://www.youtube.com/watch?v=03wl8gyziS8)

## 参考
- [About Swift](https://docs.swift.org/swift-book/)
- [The Swift Programming Language\(日本語版\)](https://www.swiftlangjp.com/)
- [Swift での Copy on Write の実装方法の解説](https://qiita.com/omochimetaru/items/f32d81eaa4e9750293cd)
    - この辺をみながらcopy-on-writeを自前実装するのも楽しそう。

## メモ
- 最適化の例

```swift
let values = [1, nil, 3, 5, nil]

// compactMapのために配列がコピーされてしまうのでその分遅い
for value in values.compactMap({$0}) {
    print(value)
}

// こちらのほうが早い
for case let value? in values {
    print(value)
}
```

- `copy on write`

```swift
var a = [1, 5, 10, 5]
var b = a  // この時点ではcopyされない。実際に使用するまでcopyされない。

// copyされていない場合は同じものを参照されているので、場合によってはランタイムエラーになる
DispatchQueue.global().async {
    b.append(10)
}

DispatchQueue.global().async {
    a.append(10)
}
```

- structのcopy on writeの仕組み
- 内部でbufferを持っておき最適化をしている
- もし自分がメモリを大量に使うが、頻繁にIOする型を使う場合にこの手法をつかうこともできる。

```swift
class ArrayBuffer<Element> {
    
}

struct Array<Element> {
    private var buffer = ArrayBuffer<Element>()  // class
    
    subscript(index: Int) {
        get {
            
        }
        
        set {
            if !isKnownUniquelyReferenced(buffer) {
                // 複数の場所で共有されている場合
                buffer = ArrayBuffer(buffer)
            }
            
            // bufferに自分の値を入れる
            buffer[index] = newValue
        }
    }
}
```
