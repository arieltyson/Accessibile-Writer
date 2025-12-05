import SwiftUI

struct ContentView: View {
    @Bindable var store: DocumentStore
    
    var body: some View {
        NavigationSplitView {
            // Column 1: The Sidebar
            List(selection: $store.selection) {
                ForEach(store.pages) { page in
                    NavigationLink(value: page.id) {
                        HStack {
                            Image(systemName: "doc.text")
                            Text("Page \(page.number)")
                            Spacer()
                            if page.isBookmarked {
                                Image(systemName: "bookmark.fill")
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Pages")
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
            FormattingInspectorStub()
        }
    }
}

#Preview {
    ContentView(store: DocumentStore())
}
