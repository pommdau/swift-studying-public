# 参考
- [swiftui - Why is async task cancelled in a refreshable Modifier on a ScrollView (iOS 16) - Stack Overflow](https://stackoverflow.com/questions/74977787/why-is-async-task-cancelled-in-a-refreshable-modifier-on-a-scrollview-ios-16)
- [refreshableから学ぶSwift Concurrency #SwiftUI - Qiita](https://qiita.com/uhooi/items/c0bff1724856f0eef226#%E3%83%87%E3%83%BC%E3%82%BF%E3%81%AE%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%AFviewmodel%E3%81%AEinit%E3%81%A7%E3%81%AA%E3%81%8Ftask%E3%81%A7%E8%A1%8C%E3%81%86)
- https://gist.github.com/treastrain/cee21a1af3127c62123c8ac1560ce9c0

# コード
- 参考を見てもどうしてもtaskをプロパティでもつ場合がわからず、下記の対応としてみた。他にいい方法はあるかも。

```swift
import SwiftUI

struct Client {
    func heavyTask() async throws {
        try await Task.sleep(for: .seconds(3))
    }
}

struct ContentView: View {
    
    @State private var client = Client()
    
    @State private var names = ["Apple", "Banana", "Orange", "Grape", "Pineapple"]
    @State private var isProcessing = false
    @State private var task: Task<(), Never>?

    var body: some View {
        NavigationStack {
            List {
                Section("Action") {
                    
                    Button("Search") {
                        handleSearching()
                    }
                                                           
                    Button("Cancel") {
                        task?.cancel()
                        task = nil
                    }
                    .disabled(!isProcessing)
                }
                
                Section("Name") {
                    ForEach(names, id: \.self) { item in
                        NavigationLink {
                            Text("\(item)_page")
                        } label: {
                            Text(item)
                        }
                    }
                    if isProcessing {
                        ProgressView()
                            .listRowBackground(Color(uiColor: UIColor.systemGroupedBackground))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .id(UUID())
                    }
                }
            }
            .refreshable {
                handleSearching()
                // このクロージャを抜けるとインジケータが消えてしまうので、isProcessingで生存期間を管理している
                while(isProcessing) {
                    try? await Task.sleep(for: .milliseconds(100))
                }
            }
            .onDisappear {
                // 画面遷移したら現在の処理をキャンセル
                task?.cancel()
                task = nil
            }
        }
    }
    
    private func handleSearching() {
        isProcessing = true
        task = Task {
            defer {
                isProcessing = false
            }
            do {
                try await client.heavyTask()
                withAnimation {
                    names.append(String(UUID().uuidString.prefix(5)))
                }
                print("task completed")
            } catch {
                if Task.isCancelled {
                    print("task cencelled")
                } else {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
```
