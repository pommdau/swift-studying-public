//
//  CLIInputParser.swift
//  HeadlessDemoMain
//
//  Created by HIROKI IKEUCHI on 2026/10/27.
//

import SwiftUI

enum CLIInputParseError: Error, LocalizedError {
    case emptyInput
    case invalidParameterJSON(String)
//    case tooManyArguments
    
    var errorDescription: String? {
        switch self {
        case .emptyInput:
            return "Input is empty."
        case .invalidParameterJSON(let json):
            return "Invalid parameters JSON: \(json)"
//        case .tooManyArguments:
//            return "Too many arguments."
        }
    }
}

/// CLIの入力を解析し、構造化された入力値に変換する。
struct CLIInputParser {
    
    static func parse(_ input: String) throws(CLIInputParseError) -> CLIInput {
        // 空白文字で最大3つの要素に分割する
        let components = input.split(maxSplits: 2, whereSeparator: { $0.isWhitespace })
        
        switch components.count {
        case 0:
            throw CLIInputParseError.emptyInput
        case 1:
            return .command(command: String(components[0]))
        case 2:
            return .subCommand(
                command: String(components[0]),
                subCommand: String(components[1])
            )
        case 3:
            let jsonString = String(components[2])
            guard let data = jsonString.data(using: .utf8),
                  let parsedParameters = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                throw CLIInputParseError.invalidParameterJSON(jsonString)
            }
            let parameters = parsedParameters
            return .subCommandWithParameters(
                command: String(components[0]),
                subCommand: String(components[1]),
                parameters: parameters
            )
        default:
            assertionFailure()
            break // 通常通らない
        }
    }
}
// MARK: - Preview

#if DEBUG

import SwiftUI

private func handleInput(_ input: String) {
    do {
        let parsedInput = try CLIInputParser.parse(input)
        parsedInput.printDescription()
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

#Preview {
    Text("Previews")
        .onAppear() {
            print("*** 正常系のチェック ***")
            handleInput("ls")
            handleInput("do Save")
            handleInput(#"do selectTab {"tabID" : "Products"}"#)
            handleInput(#"do selectTab {"tabID" : "Products", "productID" : "123"}"#)

            print("*** 異常系のチェック ***")
            handleInput("")
            handleInput("do selectTab invalidParameter")

        }
}
#endif
