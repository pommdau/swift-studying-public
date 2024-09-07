# Swift Macrosの基本的な作成手順

- 参考: [マクロ\(Macros\)](https://www.swiftlangjp.com/language-guide/macros.html)

```sh
# マクロ名に指定するディレクトリを作成
mkdir IKEHProject
cd IKEHProject
# マクロの作成
swift package init --type macro
```

- `Package.swift`の中身は以下の通り

```swift
// swift-tools-version: 5.9
// このパッケージをビルドするために必要な最小のSwiftバージョンを指定しています。ここではSwift 6.0が指定されています。

import PackageDescription
import CompilerPluginSupport

let package = Package(
    
    /* productsセクション */
    
    // パッケージの名前
    name: "IKEHProject",
    // サポートするプラットフォームの最小バージョン
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    
    /* productsセクション */
    
    products: [
        // ライブラリとして公開されるターゲット「IKEHProject」を定義します。
        .library(
            name: "IKEHProject",
            targets: ["IKEHProject"]
        ),
        // 実行可能なターゲット「IKEHProjectClient」を定義しています。このターゲットはパッケージ内で使われます。
        .executable(
            name: "IKEHProjectClient",
            targets: ["IKEHProjectClient"]
        ),
    ],
    
    /* dependenciesセクション */
    
    // 外部依存パッケージを指定します。ここでは、SwiftSyntaxを扱うために「swift-syntax」パッケージを依存関係として追加しています。
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
    ],
    
    /* targetsセクション */
    
    targets: [
        // マクロ実装を含むターゲット「IKEHProjectMacros」を定義しています。これは、ソースコード変換を行うためのマクロの実装を提供します。
        .macro(
            name: "IKEHProjectMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // 「IKEHProject」ライブラリターゲットを定義します。このターゲットは「IKEHProjectMacros」に依存しており、
        // マクロをAPIとして提供します。
        .target(name: "IKEHProject", dependencies: ["IKEHProjectMacros"]),

        // 「IKEHProjectClient」実行可能ターゲットを定義しています。このターゲットは「IKEHProject」に依存しており、そのライブラリとマクロを利用します。
        .executableTarget(name: "IKEHProjectClient", dependencies: ["IKEHProject"]),

        // テストターゲット「IKEHProjectTests」を定義しています。
        // これは「IKEHProjectMacros」をテストするために使用され、SwiftSyntaxMacrosTestSupportも依存関係として追加されています。
        .testTarget(
            name: "IKEHProjectTests",
            dependencies: [
                "IKEHProjectMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
```

- プロジェクト構成は以下の通り(コメントは適当かも)

![](https://i.imgur.com/pUv4AkC.jpeg)

## IKEHProjectの例

```swift
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "IKEHProjectMacros", type: "StringifyMacro")

@freestanding(expression)
public macro fourCharacterCode(for characters: String) -> UInt32 = #externalMacro(module: "IKEHProjectMacros", type: "FourCharacterCode")
```

## IKEHProjectClientの例

```swift
import IKEHProject

let a = 17
let b = 25

let (result, code) = #stringify(a + b)
/*
 The value 42 was produced by the code "a + b"
 */
print("The value \(result) was produced by the code \"\(code)\"")

let name = "John"
let (result2, code2) = #stringify("Hello, \(name)")
/*
 result2: Hello, John,
 code2: "Hello, \(name)"
 */
print("result2: \(result2),\ncode2: \(code2)")

let abcd = #fourCharacterCode(for: "ABCD")
```

## IKEHProjectMacrosの例

```swift
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct StringifyMacro: ExpressionMacro {
    /*
     node: マクロ式の構文Tree
     context: コンパイラとの通信に使用できるコンテキスト
     returnするのは書き換えた構文
     */
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        // argumentは単一のものを想定
        // let argument: ExprSyntax
        guard let argument = node.arguments.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        return "(\(argument), \(literal: argument.description))"
    }
}

@main
struct IKEHProjectPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        FourCharacterCode.self,
    ]
}
```

## IKEHProjectTestsの例

```swift
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import SwiftSyntaxMacroExpansion // for BasicMacroExpansionContext

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(IKEHProjectMacros)
import IKEHProjectMacros

let testMacros: [String: Macro.Type] = [
    "stringify": StringifyMacro.self,
    "fourCharacterCode": FourCharacterCode.self,
]
#endif

final class IKEHProjectTests: XCTestCase {
    func testMacro() throws {
        #if canImport(IKEHProjectMacros)
        assertMacroExpansion(
            """
            #stringify(a + b)
            """,
            expandedSource: """
            (a + b, "a + b")
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacroWithStringLiteral() throws {
        #if canImport(IKEHProjectMacros)
        assertMacroExpansion(
            #"""
            #stringify("Hello, \(name)")
            """#,
            expandedSource: #"""
            ("Hello, \(name)", #""Hello, \(name)""#)
            """#,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
```

## swift-macro-testingの導入
- [swift\-macro\-testing](https://github.com/pointfreeco/swift-macro-testing)
- `Package.swift`の設定(バージョンは都度指定)

```diff
// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "UserDefaultsKey",
    platforms: [.macOS(.v11), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UserDefaultsKey",
            targets: ["UserDefaultsKey"]
        ),
        .executable(
            name: "UserDefaultsKeyClient",
            targets: ["UserDefaultsKeyClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
+        // https://github.com/pointfreeco/swift-macro-testing/releases
+        .package(url: "https://github.com/pointfreeco/swift-macro-testing", from: "0.5.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "UserDefaultsKeyMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(name: "UserDefaultsKey", dependencies: ["UserDefaultsKeyMacros"]),

        // A client of the library, which is able to use the macro in its own code.
        .executableTarget(name: "UserDefaultsKeyClient", dependencies: ["UserDefaultsKey"]),

        // A test target used to develop the macro implementation.
        .testTarget(
            name: "UserDefaultsKeyTests",
            dependencies: [
                "UserDefaultsKeyMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
+                .product(name: "MacroTesting", package: "swift-macro-testing"),
            ]
        ),
    ]
)
```

- テストコード

```swift
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import MacroTesting // from: swift-macro-testing
import UserDefaultsKeyMacros

class UserDefaultsKeyTests: XCTestCase {
    func testUserDefaultsKey() {
        assertMacro(["AddUserDefaultsKey": AddUserDefaultsKeyMacro.self]) {
//        assertMacro(["AddUserDefaultsKey": AddUserDefaultsKeyMacro.self], record: true) {  // デバッグ用(expansionが自動で更新される)
            #"""
            @AddUserDefaultsKey
            struct Person {
                @AppStorage(UserDefaultsKey.firstName.key)
                var firstName: String = "Taro"
                
                @AppStorage(UserDefaultsKey.lastName.key)
                var lastName: String = "Daniel"

                @AppStorage(UserDefaultsKey.age.key)
                var age: Int = 20

                var birthday: Date?
                
                var fullName: String {
                    return "\(lastName) \(firstName)"
                }
            }
            """#
        } expansion: {
            #"""
            struct Person {
                @AppStorage(UserDefaultsKey.firstName.key)
                var firstName: String = "Taro"
                
                @AppStorage(UserDefaultsKey.lastName.key)
                var lastName: String = "Daniel"

                @AppStorage(UserDefaultsKey.age.key)
                var age: Int = 20

                var birthday: Date?
                
                var fullName: String {
                    return "\(lastName) \(firstName)"
                }

                enum UserDefaultsKey: String, CaseIterable {
                    case firstName = "Person_firstName"
                    case lastName = "Person_lastName"
                    case age = "Person_age"
                }

                func reset(of key: UserDefaultsKey) {
                    switch key {
                    case .firstName:
                        firstName = "Taro"
                    case .lastName:
                        lastName = "Daniel"
                    case .age:
                        age = 20
                    }
                }
            }
            """#
        }
    }
    
    func testUserDefaultsKeyWithNoValidProperty() {
        assertMacro(["AddUserDefaultsKey": AddUserDefaultsKeyMacro.self]) {
//        assertMacro(["AddUserDefaultsKeyMacro": AddUserDefaultsKeyMacro.self], record: true) {  // デバッグ用(expansionが自動で更新される)
            #"""
            @AddUserDefaultsKey
            struct Person {
                let name: String
            }
            """#
        } expansion: {
            """
            struct Person {
                let name: String
            }
            """
        }
    }
}
```
