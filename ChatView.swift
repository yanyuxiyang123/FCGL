import SwiftUI

struct ChatView: View {
    let chat: ChatConversation // 添加 chat 作为参数
    @State private var messages: [Message]  // 使用 Message 结构体
    @State private var messageText: String = ""

    init(chat: ChatConversation) {
        self.chat = chat
        _messages = State(initialValue: chat.messages) // 初始化消息
    }

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages) { message in
                        HStack {
                            if !message.isSentByCurrentUser { Spacer() }
                            Text(message.text)
                                .padding()
                                .background(message.isSentByCurrentUser ? Color.blue : Color.gray.opacity(0.2))
                                .cornerRadius(15)
                                .foregroundColor(message.isSentByCurrentUser ? .white : .black)
                            if message.isSentByCurrentUser { Spacer() }
                        }
                    }
                }
            }
            .padding()

            HStack {
                TextField("输入消息...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 40)

                Button(action: sendMessage) {
                    Text("发送")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle(chat.contactName) // 设置导航标题为联系人名称
    }

    func sendMessage() {
        let newMessage = Message(text: messageText, isSentByCurrentUser: true)
        messages.append(newMessage)
        messageText = ""
    }
}
