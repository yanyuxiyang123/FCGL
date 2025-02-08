import SwiftUI

struct PostDetailView: View {
    let post: ForumPost  // 传入的帖子数据
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(post.authorAvatar)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(post.authorName)
                        .font(.headline)
                    Text("发布于 \(formattedDate())")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 10)

            Text(post.content)
                .font(.body)
                .padding(.bottom, 20)

            Spacer()
        }
        .padding()
        .navigationTitle("帖子详情")
    }
    
    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: Date()) // 这里用当前时间，实际可用 post.time
    }
}
