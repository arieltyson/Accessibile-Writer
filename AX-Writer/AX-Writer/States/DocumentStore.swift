import Observation

@Observable
class DocumentStore {
    var pages: [DocumentPage]
    var selection: DocumentPage.ID?
    var isInspectorPresented: Bool = true
    
    init() {
        // Seed the app with 20 pages of dummy content
        self.pages = (1...20).map { index in
            DocumentPage(
                number: index,
                isBookmarked: false,
                content: "This is the content for page \(index). \n\nStart typing to edit..."
            )
        }
    }
}
