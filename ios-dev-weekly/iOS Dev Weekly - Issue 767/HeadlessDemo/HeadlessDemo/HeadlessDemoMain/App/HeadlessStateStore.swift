import Foundation
import Observation
import Network

/// ヘッドレスモードの状態を保持するクラス
@MainActor
@Observable
final class HeadlessStateStore {
    
    static var shared: HeadlessStateStore = .init() // 各画面で利用することを見越したシングルトン
    
    private(set) var input: CLIInput?
    private(set) var error: Error?
    private(set) var clientState: NWListener.State?

    private let client: HeadlessServerClient

    init() {
        client = HeadlessServerClient()
        client.delegate = self
    }

    func start() {
        do {
            try client.start()
        } catch {
            self.error = error
        }
    }
}

// MARK: - HeadlessServerClientDelegate

extension HeadlessStateStore: HeadlessServerClientDelegate {
    
    func serverClient(_ client: HeadlessServerClient, responseFor input: String) -> String {
        // 状態をリセット
        self.input = nil
        self.error = nil
        
        // CLIへ表示する文字列を返す
        do {
            let input = try CLIInputParser.parse(input)
            self.input = input
            return "✓ \(input.oneLineDescription)"
        } catch {
            self.error = error
            return "error: \(error.localizedDescription)"
        }
    }

    func serverClient(_ client: HeadlessServerClient, didChangeState state: NWListener.State) {
        clientState = state
    }
}
