//
//  UserView.swift
//  SwiftZoominDemo
//
//  Created by HIROKI IKEUCHI on 2023/10/27.
//

import SwiftUI

struct UserView: View {
    
    @StateObject private var state: UserViewState
    
    init(id: User.ID) {
        self._state = StateObject(wrappedValue: UserViewState(id: id))
    }
    
    var body: some View {
        VStack {
            Text(state.user?.name ?? "User Name")
                .redacted(reason: state.user == nil ? .placeholder : [])
                .font(.title)
        }
        .task {
            await state.load()
        }
    }
}

#Preview {
    UserView(id: "A")
}
