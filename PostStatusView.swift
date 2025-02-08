struct PostStatusView: View {
    @State private var statusText: String = ""
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        VStack {
            TextField("说点什么...", text: $statusText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            ImagePicker(selectedImages: $selectedImages)
                .padding()
            
            Button("发布") {
                // 发布说说的操作
                print("发布说说: \(statusText)")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("发说说")
    }
}
