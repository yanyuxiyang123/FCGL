import SwiftUI

@main
struct CampusVoteApp: App {
    @StateObject private var voteManager = VoteManager()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(voteManager)  // 共享 VoteManager 实例
        }
    }
}
