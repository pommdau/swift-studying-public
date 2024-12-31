//
//  APIClient.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import Foundation

enum APIClient {
    
    // アクセストークンを返す
    static func logIn(withName name: String, password: String) async throws -> String {
        let httpBody: Data = try JSONEncoder().encode([
            "name": name,
            "password": password
        ])
        var request: URLRequest = .init(url: .init(string: "http://localhost:8080/log-in")!)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        
        // DEBUGGING
        return "dummy-token"
        
        // 本来の処理
        
        // 本当は共通化すること
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: request)
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
        
        
        guard let accessToken = String(data: data, encoding: .utf8) else {
            throw LoginError(name: name, password: password)
        }
        return accessToken
    }
    
    static func userTimeline(for id: User.ID, before: Post.ID? = nil) async throws -> Timeline? {
        
        // DEBUGGING
        if before != nil {
            return Timeline(posts: Array(Post.sampleData[10...19]), users: User.sampleData)
        } else {
            return Timeline(posts: Array(Post.sampleData[0...9]), users: User.sampleData)
        }
        
        // 本来の処理
        
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

