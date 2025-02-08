struct MainTabView: View {
    @State private var showSheet = false // 控制弹出界面
    
    var body: some View {
        TabView {
            ForumView() // 添加了ForumView
                .tabItem {
                    Label("论坛", systemImage: "bubble.left.and.bubble.right")
                }
            
            ContentView()
                .tabItem {
                    Label("投票", systemImage: "checkmark.circle.fill")
                }
            
            PostView()
                .tabItem {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.blue).frame(width: 50, height: 50))
                }
                .onTapGesture {
                    showSheet.toggle() // 点击加号时，弹出菜单
                }
                .padding(.top, -20) // 提高加号按钮的位置
            
            MessagesView()
                .tabItem {
                    Label("私信", systemImage: "message.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("我的", systemImage: "person.fill")
                }
        }
        .sheet(isPresented: $showSheet) {
            PostOptionsView() // 弹出半界面，显示“发说说”和“传相册”
        }
    }
}
