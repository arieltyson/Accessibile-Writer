import SwiftUI

struct SidebarView: View {
    @Bindable var store: DocumentStore

    var body: some View {
        List(selection: $store.selection) {
            ForEach($store.pages) { $page in
                NavigationLink(value: page.id) {
                    PageRow(page: $page)
                }
                .accessibilityAction(
                    named: page.isBookmarked ? "Remove Bookmark" : "Bookmark"
                ) {
                    page.isBookmarked.toggle()
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

#Preview {
    let store = DocumentStore()
    return NavigationSplitView {
        SidebarView(store: store)
    } detail: {
        Text("Preview")
    }
}
