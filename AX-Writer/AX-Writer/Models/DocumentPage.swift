import Foundation

struct DocumentPage: Identifiable, Hashable {
    let id = UUID()
    let number: Int
    var isBookmarked: Bool
    var content: String
}
