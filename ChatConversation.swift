// ChatConversation.swift
import Foundation

struct ChatConversation {
    let id: UUID
    let contactName: String  // 联系人名称
    let avatar: String  // 联系人头像
    let lastMessage: String  // 最后一条消息
    var messages: [Message]  // 存储消息的数组

    init(id: UUID, contactName: String, avatar: String, lastMessage: String, messages: [Message]) {
        self.id = id
        self.contactName = contactName
        self.avatar = avatar
        self.lastMessage = lastMessage
        self.messages = messages
    }
}
