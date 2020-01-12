import SwiftUI
import SwiftShogi

struct SquareButton<Label> : View where Label : View {
    private let square: Square
    private let action: (Square) -> Void
    private let label: Label

    init(file: File, rank: Rank, action: @escaping (Square) -> Void, @ViewBuilder label: (Square) -> Label) {
        self.square = Square(file: file, rank: rank)
        self.action = action
        self.label = label(square)
    }
    var body: some View {
        Button(action: { self.action(self.square) }) { label }
    }
}
