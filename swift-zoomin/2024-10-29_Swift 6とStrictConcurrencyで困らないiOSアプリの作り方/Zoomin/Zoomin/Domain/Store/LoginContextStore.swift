//
//  LoginContextStore.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/31.
//

import Foundation

//@MainActor
//final class LoginContextStore: ObservableObject {
//    
//    // プロセスのライフサイクルを考えて、アプリの起動中ずっと存在してかつSingle Sourceなのでここではシングルトンとする
//    static let shared: LoginContextStore = .init()
//    
//    @Published private(set) var value: LoginContext?
//    
//    // TODO: Repository経由で取得させるようにできると、テスタブルにしやすい
//    func logIn(withName name: String, password: String) async throws {
//        let accessToken = try await APIClient.logIn(withName: name, password: password)        
//        value = LoginContext(accessToken: accessToken)
//    }
//}

@MainActor @Observable
final class LoginContextStore {
    
    // プロセスのライフサイクルを考えて、アプリの起動中ずっと存在してかつSingle Sourceなのでここではシングルトンとする
    static let shared: LoginContextStore = .init()
    
    private(set) var value: LoginContext?
    
    // TODO: Repository経由で取得させるようにできると、テスタブルにしやすい
    func logIn(withName name: String, password: String) async throws {
        let accessToken = try await APIClient.logIn(withName: name, password: password)
        value = LoginContext(accessToken: accessToken)
    }
}
