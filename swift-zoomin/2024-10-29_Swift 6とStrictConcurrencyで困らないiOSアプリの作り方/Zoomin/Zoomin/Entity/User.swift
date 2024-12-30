//
//  User.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import SwiftID

struct User: Sendable, Equatable, Codable, Identifiable {
    var id: ID
    let name: String
    var introduction: String
    
    struct ID: StringIDProtocol {
        let rawValue:  String
        init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

import Foundation

extension User {
    static var sampleData: [User.ID: User] {
        Dictionary(uniqueKeysWithValues: (1...20).map { index in
            return ("user-\(index)", User(
                id: "user-\(index)",
                name: "User\(index)",
                introduction: "これはUser\(index)の紹介文です。"
            ))
        })
    }
}
