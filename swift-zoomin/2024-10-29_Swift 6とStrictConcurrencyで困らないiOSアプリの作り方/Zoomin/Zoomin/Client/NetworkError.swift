//
//  NetworkError.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/30.
//

import struct Foundation.URLError

// Error型は全部Sendableに準拠している(=Sendableに準拠していないプロパティは持たせられない)
struct NetworkError: Error {
    var cause: URLError
}
