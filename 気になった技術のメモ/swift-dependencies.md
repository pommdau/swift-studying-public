# swift-dependencies
## 感想
- 最初の記事の通りTCA外でもメリットが多いので採用の価値が高そう
- protocolではなくstructはまだ試せてない
- 実際になにかのサイドプロジェクトで組み込んでみて実感したい所

## 参考
- [swift-dependencies の使い方・メリット・注意点](https://zenn.dev/mayaa/articles/409c07b5d9e0cb)
- [swift-dependenciesによるDI | ドクセル](https://www.docswell.com/s/usami-k/KNR6NE-swift-dependencies#p2)
- https://github.com/pointfreeco/swift-dependencies

## 基本(protocol)の使い方

```swift
//
//  ContentView.swift
//  SwiftDepenDemo
//
//  Created by HIROKI IKEUCHI on 2025/03/31.
//

import SwiftUI
import Dependencies


// MARK: - RandomNumberClient

public protocol RandomNumberClientProtocol: Sendable {
    func fetch() async throws -> Int
}

public struct RandomNumberClient: RandomNumberClientProtocol {

    public init() {}
    
    public func fetch() async throws -> Int {
        try await Task.sleep(for: .seconds(0.1))
        return Int.random(in: 1...100)
    }
}

public struct RandomNumberClientMock: RandomNumberClientProtocol {

    var resultValue: Int = .zero
    
    public init(resultValue: Int = .zero) {
        self.resultValue = resultValue
    }
    
    public func fetch() async throws -> Int {
        try await Task.sleep(for: .seconds(0.1))
        return resultValue
    }
}

// MARK: - DI

private enum RandomNumberClientKey: DependencyKey {
    static let liveValue: any RandomNumberClientProtocol = RandomNumberClient()
}

extension DependencyValues {
    public var randomNumberClient: any RandomNumberClientProtocol {
        get { self[RandomNumberClientKey.self] }
        set { self[RandomNumberClientKey.self] = newValue }
    }
}

// MARK: - ViewModel


@MainActor
@Observable
class ContentViewModel {
    
    var number: Int = .zero
    
    // https://github.com/pointfreeco/swift-dependencies/discussions/99
    @ObservationIgnored @Dependency(\.randomNumberClient) private var randomNumberClient
    
    func fetchNumber() async {
        do {
            try? await Task.sleep(for: .seconds(0.1))
            number = try await randomNumberClient.fetch()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - View

struct ContentView: View {
    
    @State private var viewModel: ContentViewModel = .init()
    
    @State private var diViewModel: ContentViewModel = withDependencies {
        $0.randomNumberClient = RandomNumberClientMock(resultValue: 999)
    } operation: {
        ContentViewModel()
    }
    
    var body: some View {
        VStack {
            Text("Number: \(viewModel.number)")
            Button("Random Number") {
                Task {
                    await viewModel.fetchNumber()
                }
            }
            
            Text("Number: \(diViewModel.number)")
            Button("Random Number") {
                Task {
                    await diViewModel.fetchNumber()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

