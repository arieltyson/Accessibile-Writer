import SwiftUI

struct ContentView: View {
    @Bindable var store: DocumentStore
    
    var body: some View {
        NavigationSplitView {
            SidebarView(store: store)
        } detail: {
            if let selectedID = store.selection,
               let index = store.pages.firstIndex(where: { $0.id == selectedID }) {

                TextEditor(text: $store.pages[index].content)
                    .font(.body)
                    .padding()
                    .navigationTitle("Page \(store.pages[index].number)")
            } else {
                ContentUnavailableView("Select a Page", systemImage: "doc.text")
            }
        }
        .inspector(isPresented: $store.isInspectorPresented) {
            FormattingInspectorView()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    store.isInspectorPresented.toggle()
                } label: {
                    Label("Toggle Inspector", systemImage: "sidebar.right")
                }
                .keyboardShortcut("i", modifiers: [.command, .option])
            }
        }
    }
}

#Preview {
    ContentView(store: DocumentStore())
}
