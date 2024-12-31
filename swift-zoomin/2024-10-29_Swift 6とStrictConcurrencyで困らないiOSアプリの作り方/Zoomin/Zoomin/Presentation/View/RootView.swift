//
//  RootView.swift
//  Zoomin
//
//  Created by HIROKI IKEUCHI on 2024/12/31.
//

import SwiftUI
import Combine

struct RootView: View {
    
    @State private var state: RootViewState = .init()
    
    var body: some View {
        Group {
            
        }
        .fullScreenCover(isPresented: .constant(state.presentsLoginView)) {
            LoginView()
        }
    }
}

#Preview {
    RootView()
}
