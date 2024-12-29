//
//  PostView.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    let user: User?
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text("@\(user?.name ?? "name")")
                    .redacted(reason: user == nil ? .placeholder : [])
                    .font(.headline)
                Text(post.content)
                HStack {
                    Text(post.time, style: .date)
                    Text(post.time, style: .time)
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    PostView(
        post: Post(
            id: "",
            authorID: "",
            name: "@koher",
            content: "Lorem ipsum dolor sit amet.",
            time: Date()
        ),
        user: User(
            id: "",
            name: "koher",
            introduction: "<intro>"
        )
    )
    
    PostView(
        post: Post(
            id: "",
            authorID: "",
            name: "@koher",
            content: "Lorem ipsum dolor sit amet.",
            time: Date()
        ),
        user: nil        
    )
}
