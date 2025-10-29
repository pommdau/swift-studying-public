- 実装がわかりにくくなるので、マルチモジュールのモジュール単位での導入などはありよりだと思った。
- 参考
  - [Method Swizzlingを行うライブラリにおけるマルチモジュール設計 - Speaker Deck](https://speakerdeck.com/yoshikma/method-swizzlingwoxing-uraiburariniokerumarutimoziyurushe-ji)
  - [Swiftのライフサイクル系メソッドに、共通処理を差し込む方法（Method Swizzling） · すっさんぽ](https://sussan-po.com/2021/05/01/method-swizzling-in-swift/)

```swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIViewController.swizzling()
        return true
    }

}

extension UIViewController {

    class func swizzling() {
        let originalSelector = #selector(viewDidLoad)
        let swizzledSelector = #selector(swizzled_viewDidLoad)
        
        guard let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector),
              let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector) else {
            return
        }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    @objc func swizzled_viewDidLoad() {
        print("🐱: swizzled_viewDidLoad")
        
        // 通常のviewDidLoad処理を実行する
        // 呼び出すメソッドは `swizzled_viewDidLoad` だが、メソッドが入れ替わっているから、
        // 実装の中身は「オリジナルの」`viewDidLoad` になっている
        swizzled_viewDidLoad()
    }
}
```
