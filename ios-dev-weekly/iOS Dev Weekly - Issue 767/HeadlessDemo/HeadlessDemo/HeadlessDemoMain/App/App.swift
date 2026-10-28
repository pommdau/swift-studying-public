import SwiftUI

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    HeadlessStateStore.shared.start()
                }
        }
    }
}
