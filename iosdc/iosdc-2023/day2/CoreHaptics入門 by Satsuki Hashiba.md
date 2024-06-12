# [CoreHaptics入門 by Satsuki Hashiba](https://fortee.jp/iosdc-japan-2023/proposal/b630fa79-2c28-41ec-a6b2-6954b62f1858)
- [Core Haptics](https://developer.apple.com/documentation/corehaptics/)
- [HapticsDemo](https://github.com/shiba1014/HapticsDemo)

# macOSに関して
- macOSは違うAPIなので注意
  - [トラックパッドの触覚フィードバックを利用する](https://qiita.com/takebayashi/items/38c8dd4f8df73ca24d44#nshapticfeedbackperformer)

```swift
import SwiftUI
import CoreHaptics

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            let performer = NSHapticFeedbackManager.defaultPerformer

            for _ in 0..<10 {
                performer.perform(.alignment, performanceTime: .now)
                sleep(1)
                performer.perform(.levelChange, performanceTime: .now)
                sleep(1)
                performer.perform(.generic, performanceTime: .now)
                sleep(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
```
