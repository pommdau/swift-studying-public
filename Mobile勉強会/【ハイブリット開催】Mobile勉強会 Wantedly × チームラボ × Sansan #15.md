# [【ハイブリット開催】Mobile勉強会 Wantedly × チームラボ × Sansan \#15](https://sansan.connpass.com/event/321922/)

## [Swift6からのTyped throws](https://speakerdeck.com/toshiyana36/swift6karanotyped-throws)

![](https://i.imgur.com/xPtU7g5.jpeg)

![](https://i.imgur.com/zZ0q2F5.jpeg)

### [Typed throws in Swift explained with code examples](https://www.avanderlee.com/swift/typed-throws/)
- こちらも分かりやすい記事

### [Typed Throws in Swift 6](https://medium.com/@vereshhagin98/typed-throws-in-swift-6-76c5ff657a81)
- `switch`の`error`が`let error: ConversionError`となり方が明確になる

```swift
import Foundation

enum ConversionError: Error {
    case invalidFormat
    case outOfRange
}

func convertStringToInt(_ string: String) throws(ConversionError) -> Int {
    // Trying to convert String to Int here
    guard let number = Int(string) else {
        throw ConversionError.invalidFormat
    }

    // Check number is in range of 0...100
    guard number >= 0 && number <= 100 else {
        throw ConversionError.outOfRange
    }
    
    return number
}

do {
//    let input = "42"  // Try changing to "abc" or "150" to test errors
    let input = "150"  // Try changing to "abc" or "150" to test errors

    let number = try convertStringToInt(input)
    debugPrint("Converted number: \(number)")
} catch {
    switch error {
    case ConversionError.invalidFormat:
        debugPrint("The input string has an invalid format.")
    case ConversionError.outOfRange:
        debugPrint("The number is out of the allowed range (0-100).")
//    default:
//        debugPrint("An unknown error occurred: \(error)")
    }
}
```
