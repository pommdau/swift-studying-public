//
//  CLIInput.swift
//  HeadlessDemoMain
//
//  Created by HIROKI IKEUCHI on 2026/10/22.
//

import Foundation

/// CLIの入力形式を定義(パーサと合わせて任意の形式にして良い)
enum CLIInput {
    
    /// e.g. "ls"
    case command(command: String)
    /// e.g. "do Save"
    case subCommand(command: String, subCommand: String)
    /// e.g. #"do selectTab {"tabID" : "Products"}"#
    case subCommandWithParameters(
        command: String,
        subCommand: String,
        parameters: [String: Any]
    )
}

// MARK: - Utils

extension CLIInput {
    var command: String {
        switch self {
        case .command(let command):
            command
        case .subCommand(let command, _):
            command
        case .subCommandWithParameters(let command, _, _):
            command
        }
    }
    
    var subCommand: String? {
        switch self {
        case .command:
            nil
        case .subCommand(_, let subCommand):
            subCommand
        case .subCommandWithParameters(_, let subCommand, _):
            subCommand
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .command, .subCommand:
            nil
        case .subCommandWithParameters(_, _, let parameters):
            parameters
        }
    }
    
    var oneLineDescription: String {
        var description = ""
        description += command
        if let subCommand {
            description += " \(subCommand)"
        }
        if let parameters {
            description += " \(parameters.description)"
        }
        return description
    }
    
    func printDescription() {
        switch self {
        case .command(let command):
            print("command: \(command)")
        case .subCommand(let command, let subCommand):
            print("command: \(command)")
            print("subCommand: \(subCommand)")
        case .subCommandWithParameters(let command, let subCommand, let parameters):
            print("command: \(command)")
            print("subCommand: \(subCommand)")
            print("parameters:")
            print(Self.prettyPrintedParameters(parameters))
        }
        print("")
    }
    
    private static func prettyPrintedParameters(_ parameters: [String: Any]) -> String {
        if !parameters.isEmpty,
           let data = try? JSONSerialization.data(
            withJSONObject: parameters,
            options: [.prettyPrinted, .sortedKeys]
           ),
           let json = String(data: data, encoding: .utf8) {
            return json
        }
        
        return "{}"
    }
}
