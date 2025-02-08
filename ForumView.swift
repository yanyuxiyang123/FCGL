import SwiftUI

struct ForumView: View {
    @State private var posts: [ForumPost] = [
        ForumPost(id: UUID(), title: "论坛帖子标题1", content: "这里是帖子内容1", images: [], comments: [
            Comment(id: UUID(), userName: "张三", content: "这个帖子不错！"),
            Comment(id: UUID(), userName: "李四", content: "我也觉得很有意思")
        ]),
        ForumPost(id: UUID(), title: "论坛帖子标题2", content: "这里是帖子内容2", images: [], comments: [
            Comment(id: UUID(), userName: "蔡徐坤", content: "这个帖子看起来不错")
        ])
    ]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(posts) { post in
                    VStack(alignment: .leading, spacing: 15) {
                        Text(post.title)
                            .font(.title)
                            .bold()
                        Text(post.content)
                            .font(.body)
                            .padding(.bottom)

                        // 展示图片或视频
                        if !post.images.isEmpty {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(post.images, id: \.self) { image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(8)
                                            .clipped()
                                    }
                                }
                            }
                            .padding(.bottom)
                        }

                        // 评论区
                        VStack(alignment: .leading) {
                            Text("评论区")
                                .font(.headline)
                            ForEach(post.comments) { comment in
                                Text("\(comment.userName): \(comment.content)")
                                    .padding(.bottom, 5)
                            }
                        }
                        .padding(.top)
                        
                        // 添加评论输入框
                        CommentInputView(post: post)
                    }
                    .padding()
                    Divider()
                }
            }
        }
    }
}

struct ForumPost: Identifiable {
    let id: UUID
    let title: String
    let content: String
    let images: [UIImage]  // 支持最多9张图片
    var comments: [Comment]
}

struct Comment: Identifiable {
    let id: UUID
    let userName: String
    let content: String
}

struct CommentInputView: View {
    @State private var commentText: String = ""
    @Binding var post: ForumPost

    var body: some View {
        HStack {
            TextField("发表评论...", text: $commentText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: addComment) {
                Text("发表")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func addComment() {
        let newComment = Comment(id: UUID(), userName: "当前用户", content: commentText)
        post.comments.append(newComment)
        commentText = ""
    }
}
