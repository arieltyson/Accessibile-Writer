import SwiftUI

struct SidebarView: View {
    @Bindable var store: DocumentStore
    
    var body: some View {
        List(selection: $store.selection) {
            ForEach(store.pages) { page in
                NavigationLink(value: page.id) {
                    PageRow(page: page)
                }
            }
        }
        .navigationTitle("Pages")
        .accessibilityRotor("Bookmarks") {
            ForEach(store.pages) { page in
                if page.isBookmarked {
                    AccessibilityRotorEntry("Page \(page.number)", id: page.id)
                }
            }
        }
    }
}

struct PageRow: View {
    let page: DocumentPage
    
    var body: some View {
        HStack {
            Image(systemName: "doc.text")
                .accessibilityHidden(true)
            
            Text("Page \(page.number)")
            
            Spacer()
            
            if page.isBookmarked {
                Image(systemName: "bookmark.fill")
                    .foregroundStyle(.blue)
                    .accessibilityLabel("Bookmarked")
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    let store = DocumentStore()
    store.pages[2].isBookmarked = true
    return SidebarView(store: store)
}
