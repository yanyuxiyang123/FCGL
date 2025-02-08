import PhotosUI

struct ImagePicker: View {
    @Binding var selectedImages: [UIImage]
    
    var body: some View {
        PhotosPicker(
            selection: $selectedImages,
            maxSelectionCount: 9,
            matching: .images,
            photoLibrary: .shared()) { result in
                switch result {
                case .success(let selection):
                    for item in selection.selectedItems {
                        Task {
                            if let asset = try? await item.loadTransferable(type: UIImage.self) {
                                selectedImages.append(asset)
                            }
                        }
                    }
                case .failure(let error):
                    print("加载图片失败: \(error.localizedDescription)")
                }
            }
            .frame(height: 200)
    }
}
