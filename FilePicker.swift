import SwiftUI
import MobileCoreServices

struct FilePicker: View {
    @Binding var selectedFiles: [URL]
    
    var body: some View {
        // 使用 `UIDocumentPickerViewController` 来选择文件
        Button("选择文件") {
            // 启动文件选择器
        }
    }
}
