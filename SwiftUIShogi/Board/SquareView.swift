import SwiftUI
import SwiftShogi

struct SquareView: View {
    private let piece: Piece?

    init(piece: Piece?) {
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
        .font(.custom("Hiragino Mincho Pro W3", size: Const.boardFontSize))
        .foregroundColor(.black)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(piece: Piece(kind: .king, color: .black))
    }
}
