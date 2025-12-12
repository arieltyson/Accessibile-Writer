import SwiftUI

struct ContentView: View {
    @Bindable var store: DocumentStore
    
    var body: some View {
        NavigationSplitView {
            // Column 1: The Sidebar
            SidebarView(store: store)
        } detail: {
            // Column 2: The Editor
            if let selectedID = store.selection,
               let index = store.pages.firstIndex(where: { $0.id == selectedID }) {
                
                // We bind directly to the store's array index to allow editing
                TextEditor(text: $store.pages[index].content)
                    .font(.body)
                    .padding()
                    .navigationTitle("Page \(store.pages[index].number)")
            } else {
                ContentUnavailableView("Select a Page", systemImage: "doc.text")
            }
        }
        // Column 3: The Inspector
        .inspector(isPresented: $store.isInspectorPresented) {
            FormattingInspectorView()
        }
    }
}

#Preview {
    ContentView(store: DocumentStore())
}
