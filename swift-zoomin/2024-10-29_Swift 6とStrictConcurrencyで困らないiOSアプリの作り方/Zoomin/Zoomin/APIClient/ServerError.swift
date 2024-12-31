//
//  ServerError.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import class Foundation.HTTPURLResponse

struct ServerError: Error {
    var response: HTTPURLResponse
}
