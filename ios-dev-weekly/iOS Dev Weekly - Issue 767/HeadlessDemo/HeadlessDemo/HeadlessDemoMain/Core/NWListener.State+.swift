//
//  NWListener.State+.swift
//  HeadlessDemoMain
//
//  Created by HIROKI IKEUCHI on 2026/10/28.
//

import Foundation
import class Network.NWListener

extension NWListener.State {
    var message: String {
        switch self {
        case .setup:
            return "CLIサーバー準備中"
        case .waiting(let error):
            return "CLIサーバー待機中: \(error.localizedDescription)"
        case .ready:
            return "CLI接続可能"
        case .failed(let error):
            return "CLIサーバーエラー: \(error.localizedDescription)"
        case .cancelled:
            return "CLIサーバー停止済み"
        @unknown default:
            return "CLIサーバー状態不明"
        }
    }
}
