//
//  RoomsApp.swift
//  Rooms
//
//  Created by Mohammad Azam on 7/15/26.
//

import SwiftUI
import SwiftData

@main
struct RoomsApp: App {
    
    /*
     ModelContainer: データベース本体
     */
    private let container: ModelContainer
    
    @State private var roomSyncManager: RoomSyncManager
    
    init() {
        container = try! ModelContainer(
            for: Room.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: false) // falseなのでアプリを閉じてもデータは残る
        )
        roomSyncManager = RoomSyncManager()
        startRoomSync()
    }
    
    private func startRoomSync() {
        do {
            try roomSyncManager.start(container: container)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RoomListScreen()
            /*
             // RoomListScreen以下のViewでModelContextを使えるようになる
             
             ModelContainer = SQLiteファイルやDB接続設定を持つ箱
             ModelContext   = その箱に対して読み書きするセッション
             */
                .modelContainer(container)
                .task {
                    container.mainContext.author = "App"
                }            
        }
    }
}
