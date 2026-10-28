import Foundation

final class HeadlessDemoCLI {
    private let url = URL(string: "ws://127.0.0.1:8765")! // ws: WebSocket

    /// 標準入力の各行を1つのWebSocketメッセージとして送信する。
    func run() async {
        let session = URLSession(configuration: .default)
        var connection: URLSessionWebSocketTask?
        defer {
            // WebSocketの終了を要求し、セッションの通信も終了します。
            connection?.cancel(with: .normalClosure, reason: nil)
            session.invalidateAndCancel()
        }

        // 入力が完了するまで通信は開始されない
        while let line = readLine() {
            do {
                let task: URLSessionWebSocketTask
                if let connection {
                    // すでに接続があれば再利用
                    task = connection
                } else {
                    task = session.webSocketTask(with: url)
                    task.resume()
                    connection = task
                }
                try await task.send(.string(line))
                let response: URLSessionWebSocketTask.Message = try await task.receive()
                
                // 応答を表示
                let data: Data
                switch response {
                case .string(let text):
                    data = Data(text.utf8)
                case .data(let bytes):
                    data = bytes
                @unknown default:
                    throw URLError(.cannotDecodeContentData)
                }
                // 応答の末尾に改行（0x0A）を付けて、標準出力へ書き込みます。
                try FileHandle.standardOutput.write(contentsOf: data + Data([0x0A]))
            } catch {
                connection?.cancel(with: .goingAway, reason: nil)
                connection = nil
                let message = "error: \(error.localizedDescription) (\(url.absoluteString); launch the Debug iOS app first)\n"
                try? FileHandle.standardError.write(contentsOf: Data(message.utf8))
                // 失敗した操作は再送せず、次の入力時に接続し直す。
            }
        }
    }
}
