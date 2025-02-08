// Message.swift
import Foundation

// 定义消息类型
struct Message: Identifiable {
    let id: UUID
    let text: String
    let isSentByCurrentUser: Bool  // 判断消息是否由当前用户发送

    init(text: String, isSentByCurrentUser: Bool) {
        self.id = UUID()
        self.text = text
        self.isSentByCurrentUser = isSentByCurrentUser
    }
}
