import Foundation

class MessageManager: ObservableObject {
    @Published var candidates: [Candidate] = []
    @Published var conversations: [Conversation] = []  // 添加这个变量来存储会话

    init() {
        loadConversations()
    }

    func loadConversations() {
        // 模拟数据
        conversations = [
            Conversation(id: UUID(), username: "张锐涵", avatar: "avatar1", lastMessage: "你好！"),
            Conversation(id: UUID(), username: "测试用户", avatar: "avatar2", lastMessage: "投票支持一下！")
        ]
    }
}

struct Conversation: Identifiable {
    let id: UUID
    let username: String
    let avatar: String
    let lastMessage: String
}
