//
//  RootView.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/31.
//

import SwiftUI
import Combine

struct RootView: View {
    
    @StateObject private var state: RootViewState = .init()
    
    var body: some View {
        Group {
            
        }
        .fullScreenCover(isPresented: .constant(state.presentsLoginView)) {
            LoginView()
        }
    }
}

@MainActor
final class RootViewState: ObservableObject {
    @Published private(set) var loginContext: LoginContext?
    
    init() {
        // LoginContextStoreの変更をloginContextに伝える
        LoginContextStore.shared.$value.assign(to: &$loginContext)
    }
    
    var presentsLoginView: Bool {
        loginContext == nil
    }
}

#Preview {
    RootView()
}
