import SwiftUI
import SwiftShogi

struct PieceStandView: View {
    @EnvironmentObject var userData: UserData

    private let color: SwiftShogi.Color

    init(color: SwiftShogi.Color) {
        self.color = color
    }

    var body: some View {
        VStack {
            if capturedPieces.isEmpty {
                VerticalTextView(text: "なし")
            }

            ForEach(capturedPiecesWithoutPawns, id: \.self) { piece in
                Button(action: {
                    self.userData.updateForCapturedPiece(with: piece)
                }) {
                    Text(piece.string)
                }
            }
            if !capturedPawnPieces.isEmpty {
                Button(action: {
                    self.userData.updateForCapturedPiece(with: self.capturedPawnPieces.first!)
                }) {
                    Text(capturedPawnPieces.first!.string)
                }
            }
            if capturedPawnPieces.count >= 2 {
                Text(numberString(value: capturedPawnPieces.count))
            }
        }
        .font(.custom(Const.fontName, size: Const.boardSideFontSize))
        .foregroundColor(.black)
    }

    private var capturedPieces: [Piece] {
        userData.game.capturedPieces
            .filter { $0.color == color }
    }

    private var capturedPiecesWithoutPawns: [Piece] {
        capturedPieces
            .filter { $0.kind != .pawn(.normal) }
    }

    private var capturedPawnPieces: [Piece] {
        capturedPieces
            .filter { $0.kind == .pawn(.normal) }
    }

    private func numberString(value: Int) -> String {
        let number = NSNumber(value: value)
        return numberFormatter.string(from: number)!
    }

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ja")
        formatter.numberStyle = .spellOut
        return formatter
    }()
}

struct PieceStandView_Previews: PreviewProvider {
    static var previews: some View {
        PieceStandView(color: .black).environmentObject(UserData(game: Game(sfen: .default)))
    }
}
