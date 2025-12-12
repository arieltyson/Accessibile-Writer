import SwiftUI

struct FormattingInspectorView: View {
    @Namespace private var focusNamespace
    @AccessibilityFocusState private var isHeaderFocused: Bool

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text("Format")
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                    .padding(.top)
                    .padding(.horizontal)
                    .accessibilityFocused($isHeaderFocused)

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Style Presets")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .accessibilityHidden(true)

                    Group {
                        StyleRow(label: "Title", font: .largeTitle)
                        StyleRow(label: "Heading", font: .title)
                        StyleRow(label: "Subheading", font: .title2)
                        StyleRow(label: "Body", font: .body)
                        StyleRow(label: "Caption", font: .caption)
                    }
                }
                .padding(.bottom)
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Style Presets")

                Divider()

                Toggle("Bold Text", isOn: .constant(true))
                    .padding(.horizontal)
                    .keyboardShortcut("b", modifiers: .command)

                Spacer()
            }
        }
        .task {
            try? await Task.sleep(for: .milliseconds(100))
            isHeaderFocused = true
        }
    }
}

#Preview {
    FormattingInspectorView()
        .frame(width: 300)
}
