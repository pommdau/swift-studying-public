import SwiftUI

struct ContentView: View {
    
    @State var stateStore: HeadlessStateStore?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Headless Demo Main")
                    .font(.title.bold())
                field("通信状態", stateStore?.clientState?.message ?? "(nil)")
                field("コマンド", stateStore?.input?.command ?? "(nil)")
                field("操作名", stateStore?.input?.subCommand ?? "(nil)")
                field("パラメータ", stateStore?.input?.parameters?.description ?? "(nil)")
                
                if let error = stateStore?.error {
                    field("エラー", error.localizedDescription)
                        .foregroundStyle(.red)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .onAppear {
            stateStore = .shared
        }
        .onDisappear {
            stateStore = nil
        }
    }

    private func field(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value.isEmpty ? "-" : value)
                .font(.body.monospaced())
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
