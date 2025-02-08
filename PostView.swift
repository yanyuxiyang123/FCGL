import SwiftUI

struct PostView: View {
    @State private var showTextPost = false
    @State private var showAlbumPost = false
    @State private var showActionSheet = false  // 用于控制 ActionSheet 的显示

    var body: some View {
        VStack {
            // 加号按钮
            HStack {
                Spacer()
                Button(action: {
                    showActionSheet = true  // 显示 ActionSheet
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.blue))
                        .frame(width: 50, height: 50)
                }
                Spacer()
            }
            .padding(.top, 20)
            
            // 根据状态显示不同的发布内容视图
            if showTextPost {
                PostTextView() // 发布文字内容视图
            } else if showAlbumPost {
                PostAlbumView() // 发布相册内容视图
            }

            Spacer()
        }
        .padding()
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("选择发布内容"),
                buttons: [
                    .default(Text("发说说")) {
                        showTextPost = true
                        showAlbumPost = false
                    },
                    .default(Text("传相册")) {
                        showAlbumPost = true
                        showTextPost = false
                    },
                    .cancel() // 取消按钮
                ]
            )
        }
    }
}
