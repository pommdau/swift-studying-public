//
//  UserTimelineView.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import SwiftUI

struct UserTimelineView: View {
    
    @StateObject private var state: UserTimelineViewState
    
    init(id: User.ID) {
        _state = .init(wrappedValue: .init(id: id))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(state.posts) { post in
                    VStack {
                        PostView(
                            post: post,
                            user: state.users[post.authorID]
                        )
                        .background {
                            Color.blue
                        }
//                        .padding()
                        Divider()
                    }
                }
                Button("Read more") {
                    state.readMoreButtonPressed()
                }
                .disabled(state.isReadMoreButtonDisabled)
                .padding()
            }
            .background {
                Color.red
            }
        }
        .background {
            Color.green
        }
        .task {
            await state.task()
        }
    }    
}

#Preview {
    UserTimelineView(id: "d1f6f1d6-d846-4ea3-a929-5b82510a6127")
}

//#Preview {
//    UserTimelineView(
//        posts: [
//            Post(
//                id: "",
//                authorID: "",
//                name: "@koher",
//                content: "Lorem ipsum dolor sit amet.",
//                time: Date()
//            ),
//            Post(
//                id: "",
//                authorID: "",
//                name: "@koher",
//                content: "Lorem ipsum dolor sit amet.",
//                time: Date()
//            ),
//            Post(
//                id: "",
//                authorID: "",
//                name: "@koher",
//                content: "Lorem ipsum dolor sit amet.",
//                time: Date()
//            )
//        ],
//        users: [
//            "": User(
//                id: "",
//                name: "koher",
//                introduction: "<intro>"
//            )
//        ]
//    )
//}
