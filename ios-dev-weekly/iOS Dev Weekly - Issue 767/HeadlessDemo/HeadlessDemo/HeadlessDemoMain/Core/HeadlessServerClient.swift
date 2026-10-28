import Foundation
import Network

private enum HeadlessServerClientError: Error, LocalizedError {
    case invalidPort(UInt16)
    
    var errorDescription: String? {
        switch self {
        case .invalidPort(let port):
            "invalid port: \(port)"
        }
    }
}

protocol HeadlessServerClientDelegate: AnyObject {    
    /// サーバクライアントが入力を受け取った
    /// - Parameters:
    ///   - client: サーバクライアント
    ///   - input: 受け取った入力
    /// - Returns: CLIへ表示する文字列
    func serverClient(_ client: HeadlessServerClient, responseFor input: String) -> String
    /// サーバクライアントの状態に変更があった
    func serverClient(_ client: HeadlessServerClient, didChangeState state: NWListener.State)
}

final class HeadlessServerClient {
    
    weak var delegate: (any HeadlessServerClientDelegate)?
    /// 通信イベントを処理する専用の直列キュー
    private let queue = DispatchQueue(label: "HeadlessDemo.RemoteCommandServer")

    /// 新しい接続の受付係
    private var listener: NWListener?
    /// 受け付けた通信相手の一覧
    private var connections: [ObjectIdentifier: NWConnection] = [:]
    
    /// 接続を開始
    func start(port: UInt16 = 8765) throws {
#if DEBUG
        // 二重起動を防止
        if listener != nil {
            return
        }
        guard let networkPort = NWEndpoint.Port(rawValue: port) else {
            throw HeadlessServerClientError.invalidPort(port)
        }
        let parameters = NWParameters.tcp
        let webSocket = NWProtocolWebSocket.Options()
        webSocket.autoReplyPing = true
        parameters.defaultProtocolStack.applicationProtocols.insert(webSocket, at: 0)
        let listener = try NWListener(using: parameters, on: networkPort)
        
        // 新しい接続が来たときの処理
        listener.newConnectionHandler = { [weak self] connection in
            guard let self else {
                connection.cancel()
                return
            }
            let id = ObjectIdentifier(connection)
            self.connections[id] = connection
            connection.stateUpdateHandler = { [weak self] state in
                switch state {
                case .failed, .cancelled:
                    connection.stateUpdateHandler = nil
                    connection.cancel()
                    self?.connections.removeValue(forKey: id)
                default:
                    break
                }
            }
            self.scheduleReceiveMessage(on: connection)
            connection.start(queue: self.queue)
        }
        
        // 状態変化があったときの処理
        listener.stateUpdateHandler = { [weak self] state in
            guard let self else {
                return
            }
            self.delegate?.serverClient(self, didChangeState: state)
        }
        
        self.listener = listener
        listener.start(queue: queue)
#else
        // ReleaseビルドではCLIサーバーを起動しません。
#endif
    }
    
    /// 次のWebSocketメッセージ1件の受信を非同期で予約する。
    /// この関数は受信完了を待たずに戻る。`receiveMessage`のクロージャは、
    /// メッセージを受信したとき、または受信が終了・失敗したときに1回だけ呼ばれる。
    /// 継続的な受信ハンドラーの設定ではないため、次のメッセージを受け取るには再予約が必要。
    /// 接続時に最初の予約を行い、テキストへの応答送信後やPing・Pongの受信後に
    /// 同じ接続でこの関数を呼び直す。
    /// - Parameter connection: メッセージを受信する接続。
    private func scheduleReceiveMessage(on connection: NWConnection) {
        connection.receiveMessage { [weak self] data, context, _, error in
            guard let self,
                  error == nil,
                  let metadata = context?.protocolMetadata(definition: NWProtocolWebSocket.definition) as? NWProtocolWebSocket.Metadata
                    else {
                connection.cancel()
                return
            }
            switch metadata.opcode {
            case .text:
                guard let data,
                      let input = String(data: data, encoding: .utf8) else {
                    self.send("error: invalid UTF-8", on: connection)
                    return
                }
                guard let delegate = self.delegate else {
                    connection.cancel()
                    return
                }
                let response = delegate.serverClient(self, responseFor: input)
                self.send(response, on: connection)
            case .close:
                connection.cancel()
                /*
                 相手 → Ping：「応答できる？」
                 相手 ← Pong：「応答できる」
                 */
            case .ping, .pong:
                self.scheduleReceiveMessage(on: connection)
            default:
                self.send("error: expected a text message", on: connection)
            }
        }
    }

    /// 応答を1つのテキストメッセージとして送り、次の入力を待つ。
    private func send(_ response: String, on connection: NWConnection) {
        let metadata = NWProtocolWebSocket.Metadata(opcode: .text)
        let context = NWConnection.ContentContext(
            identifier: "response",
            metadata: [metadata]
        )
        connection.send(
            content: Data(response.utf8),
            contentContext: context,
            isComplete: true,
            completion: .contentProcessed { [weak self] error in
                guard let self, error == nil else {
                    connection.cancel()
                    return
                }
                self.scheduleReceiveMessage(on: connection)
            }
        )
    }
}
