import SwiftUI

struct VerticalTextView: View {
    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(text), id: \.self) { Text(String($0)) }
        }
    }
}
