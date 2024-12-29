//
//  Post.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import SwiftID
import struct Foundation.Date

// structは自動的にSendableとなるが(internal)、Moduleを超えた場合(public)は自動的にならないので、明示的にSendableをつけておくと良い。特にEntityに関しては。
struct Post: Sendable, Equatable, Codable, Identifiable {
    
    var id: ID
    var authorID: User.ID
    let name: String
    let content: String
    let time: Date
    
    /* 例えば下記のようにかけるようになる
     let id: Post.ID = "abc"
     またJSONEncoderで扱ったときもうまく"abc"が取れるようになる
     */
    struct ID: StringIDProtocol {
        let rawValue:  String
        init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
