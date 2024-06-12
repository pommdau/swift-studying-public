# Enumにdescriptionを実装する

## 参考
- [CustomStringConvertible](https://developer.apple.com/documentation/swift/customstringconvertible)
- [初めての Swift Package ライブラリーハンズオン](https://qiita.com/lovee/items/93e5f367a316e72ace47)
- [CustomStringConvertibleについて](https://qiita.com/nack43/items/7270b1a26b3df51d9453)

## 実装
- `CustomStringConvertible`プロトコルに準拠させ`description`を実装する
- `print`を使った際にこの内容が表示される

```swift
import Cocoa

public enum Weekday: String, CaseIterable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

extension Weekday: CustomStringConvertible {
    public var description: String {
        switch self {
        case .sunday:
            return "日曜日"
        case .monday:
            return "月曜日"
        case .tuesday:
            return "火曜日"
        case .wednesday:
            return "水曜日"
        case .thursday:
            return "木曜日"
        case .friday:
            return "金曜日"
        case .saturday:
            return "土曜日"
        }
    }
}
```

- 使用例

```swift

extension Weekday {
    public static func random() -> Self {
        allCases.randomElement()!
    }
}

// Entry Point

for _ in 0...10 {
    print(Weekday.random())
}
```

```
金曜日
金曜日
火曜日
水曜日
日曜日
土曜日
日曜日
月曜日
日曜日
火曜日
土曜日
```
