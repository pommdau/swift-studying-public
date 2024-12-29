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
