import SwiftUI
import SwiftShogi

struct SquareView: View {
    @EnvironmentObject var userData: UserData

    private let square: Square
    private let piece: Piece?

    init(square: Square, piece: Piece?) {
        self.square = square
        self.piece = piece
    }

    var body: some View {
        ZStack {
            if piece != nil {
                Text(piece!.string)
                    .rotationEffect(piece!.color.angle)
            }
        }
        .frame(width: Const.squareSize, height: Const.squareSize)
        .font(.custom(fontName, size: Const.boardFontSize))
        .foregroundColor(.black)
    }

    private var fontName: String {
        userData.previousMove?.destination == .board(square)
            ? Const.boldFontName
            : Const.fontName
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(square: .fiveI, piece: Piece(kind: .king, color: .black))
            .environmentObject(UserData(game: Game(sfen: .default)))
    }
}
