import Foundation

// 帖子结构体
struct ForumPost: Identifiable {
    let id: UUID                // 帖子的唯一 ID
    let authorID: UUID          // 帖子作者的用户 ID
    let authorName: String      // 帖子作者的姓名
    let authorAvatar: String    // 帖子作者的头像（可以是图片路径或URL）
    let content: String         // 帖子的内容
    let title: String           // 帖子的标题
    var images: [String]        // 帖子中的图片，存储图片路径或URL
    var comments: [Comment]     // 帖子的评论列表

    // 初始化
    init(id: UUID = UUID(), authorID: UUID, authorName: String, authorAvatar: String, content: String, title: String, images: [String] = [], comments: [Comment] = []) {
        self.id = id
        self.authorID = authorID
        self.authorName = authorName
        self.authorAvatar = authorAvatar
        self.content = content
        self.title = title
        self.images = images
        self.comments = comments
    }
}
