//
//  LoginContext.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/31.
//
//  AccessTokenを含んだログインに関する情報を含んだ型

import Foundation

// classでもimmutableであれば簡単にSendableになれる
final class LoginContext: Sendable {
    let accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
}
