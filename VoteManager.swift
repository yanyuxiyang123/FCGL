import Foundation
import SwiftUI

class VoteManager: ObservableObject {
    @Published var candidates: [Candidate] = []

    init() {
        loadCandidates()
        if candidates.isEmpty {
            initSampleData()
        }
    }

    private func initSampleData() {
        candidates = [
            Candidate(id: UUID(), name: "测试一", photo: "avatar1", gender: .male, votes: 0),
            Candidate(id: UUID(), name: "测试二", photo: "avatar2", gender: .female, votes: 0),
            Candidate(id: UUID(), name: "测试三", photo: "avatar3", gender: .male, votes: 0),
            Candidate(id: UUID(), name: "测试四", photo: "avatar4", gender: .female, votes: 0)
        ]
        saveCandidates()
    }

    func getTopThree() -> [Candidate] {
        return candidates.sorted { $0.votes > $1.votes }.prefix(3).map { $0 }
    }

    func vote(for candidateID: UUID) {
        if let index = candidates.firstIndex(where: { $0.id == candidateID }) {
            // 更新投票数并保存数据
            candidates[index].votes += 1
            candidates[index].lastVoted = Date()
            saveCandidates()
        }
    }

    private func saveCandidates() {
        guard let path = getFilePath() else { return }

        do {
            let data = try JSONEncoder().encode(candidates)
            try data.write(to: path)
        } catch {
            print("保存失败: \(error)")
        }
    }

    private func loadCandidates() {
        guard let path = getFilePath(), FileManager.default.fileExists(atPath: path.path) else { return }

        do {
            let data = try Data(contentsOf: path)
            candidates = try JSONDecoder().decode([Candidate].self, from: data)
        } catch {
            print("加载失败: \(error)")
        }
    }

    private func getFilePath() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?
            .appendingPathComponent("votes.json")
    }
}

/// 轻微放大动画按钮
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}
