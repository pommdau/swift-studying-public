//
//  UserRepository.swift
//  SwiftZoominDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/27.
//

import Foundation

enum UserRepository {
    
    private static let values: [User.ID: User] = {
        let values: [User] = [
            .init(id: "A", name: "Name A"),
            .init(id: "B", name: "Name B"),
            .init(id: "C", name: "Name C"),
        ]
        return [User.ID: User](uniqueKeysWithValues: values.map { ($0.id, $0) })
    }()
        
    static func fetchValue(id: User.ID) async throws -> User? {
        try await Task.sleep(nanoseconds: 2_000_000_000) // wait 2s
        return values[id]  // 本当はURLSessionから呼び出す。今回はダミー
    }
}
