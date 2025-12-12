import SwiftUI

struct PageRow: View {
    @Binding var page: DocumentPage
    @State private var isHovering = false

    var body: some View {
        HStack {
            Image(systemName: "doc.text")
                .accessibilityHidden(true)
            
            Text("Page \(page.number)")
            
            Spacer()
            
            if page.isBookmarked {
                Button {
                    page.isBookmarked.toggle()
                } label: {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(.blue)
                }
                .buttonStyle(.plain)
                .accessibilityHidden(true)
            } else if isHovering {
                Button {
                    page.isBookmarked.toggle()
                } label: {
                    Image(systemName: "bookmark")
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
                .accessibilityHidden(true)
            }
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .onHover { hovering in
            isHovering = hovering
        }
    }
}
