struct PostTextView: View {
    @State private var text: String = ""  // 用于保存输入的文本内容
    
    var body: some View {
        VStack {
            Text("发布说说")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            // 输入框
            TextField("说点什么吧...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // 发布按钮
            Button("发布") {
                // 处理发布文字内容的逻辑
                if !text.isEmpty {
                    print("发布内容：\(text)")
                    // 这里可以处理发布内容的逻辑，例如保存到数据库或发送网络请求等
                }
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}
