# [iOS Dev Weekly - Issue 672](https://iosdevweekly.com/issues/672)

## [Ask WWDC](https://askwwdc.com/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)
- WWDCに関する答えをくれるLLM
- ちょっと質問しただけだけどいい感じ

## [Non\-Sendable types are cool too you know](https://www.massicotte.org/non-sendable?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)
- `Sendable`が話題によく挙がるが、`non-Sendable`も同様に重要で完璧な解決策になることもある
- `nonisolated`による解消法
- ただしそもそもプロトコルが`MyClass`で実現できない定義になってしまっている

```swift
protocol NonIsolatedProtocol {
	func someFunction()
}

@MainActor
class MyClass: NonIsolatedProtocol {
	private let state = 0

	nonisolated func someFunction() {
		// ERROR here now because `self` is still MainActor
		print("my state is:", state)
	}
}
```

- `@MainActor`を外してしまうのがベストな解決法

```swift
protocol NonIsolatedProtocol {
	func someFunction()
}

class MyClass: NonIsolatedProtocol {
	private var state = 0

	func someFunction() {
		print("my state is:", state)
	}
}
```

- 次の問題はasync関数のnon-Sendable。
- この辺も参考になりそうだけどうまく落とし込めず…
    - [Isolated Parameters](https://www.massicotte.org/isolated-parameters)
    - [SE\-0420: Inheritance of actor isolation](https://www.massicotte.org/concurrency-swift-6-se-0420)

```swift
class MyClass {
	private var state = 0

	func someAsyncFunction(isolation: isolated (any Actor)? = #isolation) async {
		print("my state is:", state)
	}	
}

@MainActor
class Client {
	// isolated to the MainActor...
	let instance = MyClass()

	// ... this is MainActor too...
	func useInstance() async {
		// ... and now this function will be as well!
		await instance.someAsyncFunction()
	}
}
```

- Actorの復習
    - [What is an actor and why does Swift have them?](https://www.hackingwithswift.com/quick-start/concurrency/what-is-an-actor-and-why-does-swift-have-them)

```swift
actor User {
    var score = 10
    let maxScore = 100
    
    func incrementScore() {
        score += 1
    }

    func printScore() {
        print("My score is \(score)")
    }

    func copyScore(from other: User) async {
        score = await other.score
    }
}

    func checkActorAction() async {
        //            myClass.someFunction()
        let actor1 = User()
        await actor1.incrementScore()
        let actor2 = User()
        
        await print(actor1.score) // 11
        await actor1.copyScore(from: actor2)
        await print(actor1.score) // 10
        await print(actor2.score) // 10
        
        print(actor1.maxScore) // 定数なのでawait不要
    }
```

- 結論、`non-Sendable`はいいぞ。

## [Count the number of objects that pass a test in Swift using count\(where:\)](https://nilcoalescing.com/blog/CountTheNumberOfObjectsThatPassATestInSwift/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)

- Swift6から使える`count(where:)`の話

```swift
let animals = ["cat", "dog", "cat", "bird", "cat", "dog"]
let catCount = animals.count { $0 == "cat" }

// Prints `3`
print(catCount)
```

## [Async await in Swift: The Full Toolkit](https://www.emergetools.com/blog/posts/swift-async-await-the-full-toolkit)
- `Swift Concurrency`で利用できるツールとその利用方法
- `actor`の使い所。APIの利用Serviceクラスとかは確かに良さそう。トークンの取得とかは特に無駄にfetchしないようにできるのが良い。

```swift
actor AuthService {
    
    private var tokenTask: Task<String, Error>?
    
    func getBearerToken() async throws -> String {
        
        if tokenTask == nil {
            // actor ensures only one task can exist at a time 
            tokenTask = Task { try await fetchValidAuthToken() }
        }
           
        defer { tokenTask = nil }
  
        // all requests suspend here, waiting for the task to finish
        return try await tokenTask!.value
    }
}
```

- `AsyncStream`辺りが分かってないことを自覚したので下記で補足
    - [AsyncStreamを触ってみた。](https://qiita.com/kota1021/items/070340e75c9a753137b5)
    - [Swift Concurrency AsyncStreamを使ってみる](https://qiita.com/tomoyuki_HAYAKAWA/items/8b5a3a3b801fc622553f)
    - [\[Swift\] async関数とAsyncStreamのキャンセル](https://zenn.dev/kntk/articles/0001fdd2a4f76d#asyncstream%E3%81%AE%E3%82%AD%E3%83%A3%E3%83%B3%E3%82%BB%E3%83%AB)
- ちょっと分かったけど元のコードの使い方はわからずじまい。。

```swift
struct TimerCounter {
    var countStream: AsyncStream<Double> {
        return AsyncStream { continuation in
            var count = 0.0
            Task {
                for _ in 0...5 {
                    try? await Task.sleep(until: .now + .seconds(0.1))
                    count += 0.1
                    continuation.yield(count)
                }
                continuation.finish()
            }
            continuation.onTermination = { termination in
                // 終了時の処理を条件によって分岐する
                switch termination {
                case .finished: print("Stream Finished in countStream")
                case .cancelled: print("Stream Cancelled in countStream")
                @unknown default:
                    fatalError()
                }
            }
        }
    }
    
    func startCountStreaming() {
        Task {
            for await count in countStream {
                print("\(count)")
            }
            print("Stream Finished in startCountStreaming")
        }
    }
}

let timerCounter = TimerCounter()
timerCounter.startCountStreaming()

print("Stop")

RunLoop.main.run()
```

## [How to add animation to MeshGradient in SwiftUI?](https://ashishkakkad.com/2024/07/how-to-add-animation-to-meshgradient-in-swiftui/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)
- `MeshGradient`のアニメーションのアイディア

```swift
TimelineView(.animation) { timeline in
    // sinの0-1への正規化
    let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
    MeshGradient(
        width: 3,
        height: 3,
        points: [
            [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
            [0.0, 0.5], [Float(x), 0.5], [1.0, 0.5],
            [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
        ], colors: [
            .red, .red, .red,
            .black, .red, .black,
            .black, .red, .black
        ])
    .edgesIgnoringSafeArea(.all)
}
```

## [The Death of Lorem Ipsum](https://www.lukew.com/ff/entry.asp?2071&utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)
- `Lorem Ipsum`にかわりLLMがでてきたのでそれを使おうね
- そのほうが実際のデザインを確認できるので。

## [Top 5 Lessons From The Book Clean Coder](https://codingwithvera.com/top-5-clean-coder-book-lessons/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)

- [Clean Code　アジャイルソフトウェア達人の技 (アスキードワンゴ)](https://amzn.asia/d/4uZRweJ)より。原著は全ての開発者におすすめ。

>ロバート・マーティンが著書で最初に論じている教訓の 1 つは、プロフェッショナルは自分自身に責任を持つべきだということです。

>明確なコミュニケーションを確立し、「ノー」と言う方法を知ることが最も重要です。

>プロフェッショナルは、仕事をうまく、時間通りに、予算内でやり遂げたときにヒーローになります。

>私たちは何かを提供するために、快適さや健康を犠牲にすることがよくありますが、疲れれば疲れるほど、アプリにバグが入り込む可能性が高くなるということを忘れています。休みなく休まず働くことで生産性が高まると考えているなら、

>自分の分野で本当に優れたプロになるには、孤立しないことが重要です。その代わりに、同僚からできるだけ多くのことを積極的に学ぶようにしてください。

## ["Convert to Modern Objective\-C Syntax…"](https://internals.exposed/blog/posts/07-how-to-objc.html?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20672)
- (TBD)
