import Foundation

struct Candidate: Identifiable, Codable {
    let id: UUID           // 每个候选人唯一的ID
    let name: String       // 候选人姓名
    let photo: String      // 候选人头像的文件名（例如 "avatar1"）
    let gender: Gender     // 性别，使用Gender枚举
    var votes: Int         // 当前得票数
    var lastVoted: Date?   // 上次投票时间（可选类型）

    // 性别枚举，包含 male（男性）和 female（女性）
    enum Gender: String, Codable {
        case male, female
    }
}
