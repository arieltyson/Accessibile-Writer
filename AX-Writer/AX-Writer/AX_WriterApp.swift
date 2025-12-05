import SwiftUI

@main
struct AX_WriterApp: App {
    // The Store is created once at the root level.
    @State private var store = DocumentStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
        // Mac-specific: Ensure the window starts at a usable size
        #if os(macOS)
            .windowStyle(.titleBar)
            .defaultSize(width: 1000, height: 700)
        #endif
    }
}
