//
//  LoginView.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/31.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var state: LoginViewState = .init()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Zooin")
                .font(.largeTitle)
            VStack {
                TextField("Name", text: $state.name)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $state.password)
                    .textFieldStyle(.roundedBorder)
            }
            Button("Log in") {
                state.loginButtonPressed()
            }
            .disabled(state.isLoginButonDisabled)
        }
        .padding()
    }
}

@MainActor
final class LoginViewState: ObservableObject {
    @Published var name: String = ""
    @Published var password: String = ""
    
    @Published var isLoggingIn: Bool = false
    
    var isLoginButonDisabled: Bool {
        // ログインボタンを無効化する
        // ログイン情報が不十分 or ログイン処理中
        name.isEmpty || password.isEmpty || isLoggingIn
    }
    
    func loginButtonPressed() {
        isLoggingIn = true
        Task {
            defer {
                isLoggingIn = false
            }
            do {
                try await LoginContextStore.shared.logIn(withName: name, password: password)
            } catch let error as LoginError {
                // TODO: エラーハンドリング
                print(error)
            } catch {
                // TODO: エラーハンドリング
                preconditionFailure(error.localizedDescription)
            }
        }
    }
}

#Preview {
    LoginView()
}
