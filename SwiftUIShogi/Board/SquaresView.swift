import SwiftUI
import SwiftShogi

struct SquaresView<Content>: View where Content : View {
    private let content: (Square) -> Content

    init(@ViewBuilder content: @escaping (Square) -> Content) {
        self.content = content
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(File.allCases, id: \.self) { file in
                VStack(spacing: 0) {
                    ForEach(Rank.allCases, id: \.self) { rank in
                        self.content(Square(file: file, rank: rank))
                    }
                }
            }
        }
    }
}
