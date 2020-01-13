import SwiftUI
import SwiftShogi

struct BoardSideView: View {
    private let color: SwiftShogi.Color

    init(color: SwiftShogi.Color) {
        self.color = color
    }

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text(color.string)

            VerticalTextView(text: "持駒")
            PieceStandView(color: color)

            Spacer().frame(height: 8)
        }
        .frame(height: Const.boardHeight)
        .rotationEffect(color.angle)
        .font(.custom(Const.fontName, size: Const.boardSideFontSize))
        .foregroundColor(.black)
    }
}

struct BoardSideView_Previews: PreviewProvider {
    static var previews: some View {
        BoardSideView(color: .black)
            .environmentObject(UserData(game: Game(sfen: .default)))
            .frame(height: 300)
    }
}
