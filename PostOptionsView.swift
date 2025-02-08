struct PostOptionsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showTextPost = false
    @State private var showAlbumPost = false

    var body: some View {
        VStack(spacing: 20) {
            Text("选择发布内容")
                .font(.headline)
                .padding(.top)
            
            Button(action: {
                showTextPost = true
                dismiss()
            }) {
                Text("发说说")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                showAlbumPost = true
                dismiss()
            }) {
                Text("传相册")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .background(NavigationStack {
            NavigationLink(destination: PostTextView(), isActive: $showTextPost) { EmptyView() }
            NavigationLink(destination: PostAlbumView(), isActive: $showAlbumPost) { EmptyView() }
        })
    }
}
