//
//  APIClient.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import Foundation

enum APIClient {
    static func userTimeline(for id: User.ID, before: Post.ID? = nil) async throws -> Timeline? {
        
        if before != nil {
            return Timeline(posts: Array(Post.sampleData[10...19]), users: User.sampleData)
        } else {
            return Timeline(posts: Array(Post.sampleData[0...9]), users: User.sampleData)
        }
        
        var urlComponents: URLComponents = .init(string: "http://localhost:8080/user-timeline")!
        urlComponents.queryItems = [.init(name: "id", value: id.rawValue)]
        
        if let before {
            urlComponents.queryItems?.append(
                .init(name: "before", value: before.rawValue)
            )
        }
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        } catch let error as URLError {
            switch error.code {
            case .networkConnectionLost, .notConnectedToInternet, .cannotFindHost:
                throw NetworkError(cause: error)
            case .cancelled:
                throw CancellationError()
            default:
                throw error // その他システムエラー扱い
            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            preconditionFailure()
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ServerError(response: httpResponse)
        }
        
        let decoder: JSONDecoder = .init()
        decoder.dateDecodingStrategy = .iso8601
        let timeline = try decoder.decode(Timeline?.self, from: data)
        
        return timeline
    }
}
