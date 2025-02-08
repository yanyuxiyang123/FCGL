struct PostAlbumView: View {
    @State private var selectedImages: [UIImage] = []

    var body: some View {
        VStack {
            ImagePicker(selectedImages: $selectedImages)

            Button("发布相册") {
                // 发布相册的逻辑
                print("发布相册，图片数量：\(selectedImages.count)")
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
