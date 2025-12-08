import SwiftUI

struct StyleRow: View {
    let label: String
    let font: Font
    var action: () -> Void = { print("Style Applied") }
    
    var body: some View {
        HStack {
            Text(label)
                .font(font)
            Spacer()
            Button("Apply", action: action)
                .buttonStyle(.bordered)
        }
        .padding(.horizontal)
        // Combine Text + Button into a singular focus point
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(label) style")
        .accessibilityHint("Double ap to apply this formatting")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    StyleRow(label: "Title", font: .largeTitle)
}
