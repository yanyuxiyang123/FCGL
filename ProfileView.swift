import SwiftUI

struct ProfileView: View {
    @State private var username: String = "张锐涵"
    @State private var avatar: String = "avatar1"
    
    var body: some View {
        VStack {
            Image(avatar)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(username)
                .font(.title)
                .padding()
            
            Button("更换头像") {
                // 选择头像功能
            }
            .padding()
            
            Button("编辑名称") {
                // 编辑名称功能
            }
            .padding()
        }
        .navigationTitle("个人主页")
    }
}
