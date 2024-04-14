import SwiftUI

struct Line: View {
    var body: some View {
        Rectangle()
            .fill(Color.GRAY_TERTIARY)
            .frame(height: 1)
    }
}
struct CustomDivider: View {
    var body: some View {
        HStack {
            Line()
            Text("or")
                .font(.caption)
                .foregroundColor(Color.GRAY_TERTIARY)
                .padding(.horizontal, 5)
            Line()
        }
    }
}

#Preview {
    CustomDivider()
}
