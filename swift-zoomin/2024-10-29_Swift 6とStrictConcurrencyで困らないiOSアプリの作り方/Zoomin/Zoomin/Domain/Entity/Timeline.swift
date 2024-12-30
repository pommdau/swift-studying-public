//
//  Timeline.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import Foundation

struct Timeline: Sendable, Equatable, Codable {
    var posts: [Post]
    var users: [User.ID: User]
}
