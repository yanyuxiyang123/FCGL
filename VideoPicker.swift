import SwiftUI
import MobileCoreServices

struct VideoPicker: View {
    @Binding var selectedVideos: [URL]
    
    var body: some View {
        DocumentPicker(selectedFiles: $selectedVideos, allowedTypes: ["public.movie"])
    }
}

struct DocumentPicker: View {
    @Binding var selectedFiles: [URL]
    var allowedTypes: [String]
    
    var body: some View {
        // 使用 `UIDocumentPickerViewController` 来选择视频
        // 这里我们展示一个简单的按钮来启动选择器
        Button("选择视频") {
            // 启动选择器
        }
    }
}
