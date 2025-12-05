import SwiftUI

struct FormattingInspectorStub: View {
    var body: some View {
        VStack {
            Text("Inspector")
                .font(.headline)
            Text("(Formatting Tools Coming Soon)")
                .foregroundStyle(.secondary)
        }
        .frame(minWidth: 200)
    }
}
