struct UploadAlbumView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 9, // 限制最多选择9张图片
                matching: .any(of: [.images, .videos])
            ) {
                Text("选择图片/视频")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .onChange(of: selectedItems) { newItems in
                Task {
                    selectedImages = []
                    for item in newItems {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            selectedImages.append(image)
                        }
                    }
                }
            }
            
            Button("上传相册") {
                // 上传相册的操作
                print("上传了 \(selectedImages.count) 张图片")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("传相册")
    }
}
