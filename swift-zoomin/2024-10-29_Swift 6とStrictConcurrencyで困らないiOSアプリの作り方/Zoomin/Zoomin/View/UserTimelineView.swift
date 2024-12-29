//
//  UserTimelineView.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import SwiftUI

struct UserTimelineView: View {
    
    let posts: [Post]
    let users: [User.ID: User]
    
    var body: some View {
        List(posts) { post in
            PostView(
                post: post,
                user: users[post.authorID]
            )
        }
    }
}

#Preview {
    UserTimelineView(
        posts: [
            Post(
                id: "",
                authorID: "",
                name: "@koher",
                content: "Lorem ipsum dolor sit amet.",
                time: Date()
            ),
            Post(
                id: "",
                authorID: "",
                name: "@koher",
                content: "Lorem ipsum dolor sit amet.",
                time: Date()
            ),
            Post(
                id: "",
                authorID: "",
                name: "@koher",
                content: "Lorem ipsum dolor sit amet.",
                time: Date()
            )
        ],
        users: [
            "": User(
                id: "",
                name: "koher",
                introduction: "<intro>"
            )
        ]
    )
}
