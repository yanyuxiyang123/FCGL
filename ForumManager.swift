import ChatConversation

class ChatConversation: ObservableObject {
    @Published var posts: [ForumView] = []

    init() {
        loadPosts()
    }

    func loadPosts() {
        // 模拟数据
        posts = [
            ChatConversation(id: UUID(), authorID: UUID(), authorName: "张锐涵", authorAvatar: "avatar1", comments: [Comment], content: "今天的投票好激烈！", title: "投票大战", images: []),
            ChatConversation(id: UUID(), authorID: UUID(), authorName: "测试用户", authorAvatar: "avatar2", comments: [Comment], content: "测试", title: "1", images: [])
        ]
    }

    func openChat(with userID: UUID) {
        // 进入私信聊天页面
    }
}

struct ChatConversation: Identifiable {
    let id: UUID
    let authorID: UUID
    let authorName: String
    let authorAvatar: String
    let content: String
    let title: String  // 添加 title 字段
    let images: [String]  // 添加 images 字段
}
