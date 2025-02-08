import SwiftUI

struct MessagesView: View {
    @StateObject private var messageManager = MessageManager()

    var body: some View {
        NavigationStack {
            List(messageManager.conversations) { convo in
                // 将 Conversation 转换为 ChatConversation
                let chatConvo = ChatConversation(
                    id: convo.id,
                    contactName: convo.username,
                    avatar: convo.avatar,
                    lastMessage: convo.lastMessage,
                    messages: [
                        Message(text: "你好！", isSentByCurrentUser: false),
                        Message(text: "你好呀！", isSentByCurrentUser: true)
                    ]
                )

                NavigationLink(destination: ChatView(chat: chatConvo)) {
                    HStack {
                        Image(convo.avatar)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(convo.username)
                                .font(.headline)
                            Text(convo.lastMessage)
                                .font(.subheadline)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle("私信")
        }
    }
}
