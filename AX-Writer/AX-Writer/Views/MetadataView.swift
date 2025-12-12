import SwiftUI

struct MetadataView: View {
    let title: String = "Accessibility on macOS"
    let author: String = "Apple Developer"
    let description: String =
        "Learn how to make your Mac app more accessible to everyone."

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
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    MetadataView()
        .padding()
}
