//
//  UserViewState.swift
//  SwiftZoominDemo
//
//  Created by HIROKI IKEUCHI on 2023/11/14.
//

import Foundation

@MainActor
final class UserViewState: ObservableObject {
    
    let id: User.ID
    @Published private(set) var user: User?
    
    init(id: User.ID) {
        self.id = id
    }
    
    func load() async {
        do {
            user = try await UserRepository.fetchValue(id: id)
        } catch {
            // Error handling
            print(error)
        }
    }
    
}
