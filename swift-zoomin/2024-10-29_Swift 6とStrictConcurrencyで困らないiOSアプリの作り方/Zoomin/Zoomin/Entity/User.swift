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

extension User {
    static var sampleData: [User.ID: User] {
        [
            "d1f6f1d6-d846-4ea3-a929-5b82510a6127": User(
                id: "d1f6f1d6-d846-4ea3-a929-5b82510a6127",
                name: "koher",
                introduction: "<intro>"
            )
        ]
    }
}
