import SwiftUI

struct MetadataView: View {
    let title: String
    let author: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(author)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .accessibilitySortPriority(1)

            Text(description)
                .font(.body)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    MetadataView(
        title: "Accessibility on macOS",
        author: "Apple Developer",
        description:
            "Learn how to make your Mac app more accessible to everyone."
    )
    .padding()
}
