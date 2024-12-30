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

extension Post {
    static var sampleData: [Post] {
        [
            Post(
                id: "99b66859-9a0d-4fd5-922c-7ba873dadea8",
                authorID: "d1f6f1d6-d846-4ea3-a929-5b82510a6127",
                name: "@koher",
                content: "Lorem ipsum dolor sit amet.fugafuga",
                time: Date()
            ),
            Post(
                id: "4422dac7-1229-4937-9001-e126a686d4eb",
                authorID: "",
                name: "@koher2",
                content: "Lorem ipsum dolor sit amet.hogehoge",
                time: Date()
            ),
            Post(
                id: "b4778186-ed97-48f5-aa1d-f88fa1883382",
                authorID: "",
                name: "@koher3",
                content: "Lorem ipsum dolor sit amet.piyopiyp",
                time: Date()
            )
        ]
    }
}
