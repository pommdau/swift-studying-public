//
//  UserTimelineViewState.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import Foundation
import Combine

@MainActor
final class UserTimelineViewState: ObservableObject {
    
    let id: User.ID // だれのTimelineか
    
    @Published private(set) var posts: [Post] = []
    @Published private(set) var users: [User.ID: User] = [:]
    @Published private(set) var isReadMoreButtonDisabled = false
    
    init(id: User.ID) {
        self.id = id
    }
    
    func task() async {
        do {
            if let timeline = try await APIClient.userTimeline(for: id) {
                posts = timeline.posts
                users = timeline.users
            }
        } catch {
            // TODO: エラーハンドリング
            print(error)
        }
    }
    
    func readMoreButtonPressed() {
        isReadMoreButtonDisabled = true
        Task {
            defer {
                isReadMoreButtonDisabled = false
            }            
            do {
                if let timeline = try await APIClient.userTimeline(for: id, before: posts.last?.id) {
                    posts.append(contentsOf: timeline.posts)
                    for (id, user) in timeline.users {
                        users[id] = user
                    }
                }
            } catch {
                // TODO: エラーハンドリング
                print(error)
            }
        }
    }
}
