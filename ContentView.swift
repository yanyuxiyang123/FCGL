import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: VoteManager  // 通过环境变量获取 `VoteManager`
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // 实时排行榜
                VStack(spacing: 12) {
                    Text("实时排行榜")
                        .font(.headline)
                        .foregroundColor(.gray)

                    ForEach(Array(manager.getTopThree().enumerated()), id: \.element.id) { index, candidate in
                        HStack {
                            Text("第\(index + 1)名")
                                .font(.system(size: 14))
                                .frame(width: 50, alignment: .leading)

                            Text(candidate.name)
                                .font(.subheadline)
                                .frame(width: 100, alignment: .leading)

                            Text("\(candidate.votes)票")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(candidate.gender == .male ? .blue : .pink)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

                // 候选人列表
                List {
                    ForEach(manager.candidates) { candidate in
                        HStack {
                            Image(candidate.photo)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(candidate.name)
                                    .font(.headline)
                                Text(candidate.gender.rawValue)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("当前票数：\(candidate.votes)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Button(action: {
                                manager.vote(for: candidate.id)
                                alertMessage = "投票成功！"
                                showAlert = true
                            }) {
                                Text("投票")
                                    .font(.system(size: 14, weight: .bold))
                                    .padding(8)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .buttonStyle(ScaleButtonStyle())  // 使用动画按钮样式
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("投票系统")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("提示"), message: Text(alertMessage), dismissButton: .default(Text("确定")))
            }
        }
    }
}
