import SwiftUI
import SwiftShogi

struct BoardView: View {
    var body: some View {
        ZStack {
            BoardSquaresView()
            BoardBoardersView()
        }
    }
}

struct BoardSquaresView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        HStack(spacing: 0) {
            ForEach(File.allCases, id: \.self) { file in
                VStack(spacing: 0) {
                    ForEach(Rank.allCases, id: \.self) { rank in
                        SquareButton(file: file, rank: rank, action: { square in
                            self.updateUserData(with: square)
                        }) { square in
                            SquareView(square: square, piece: self.userData.game.board[square])
                                .scaleEffect(self.scaleEffect(at: square))
                                .background(self.backgroundColor(at: square))
                        }
                    }
                }
            }
        }
    }

    private func updateUserData(with square: Square) {
        switch (validMove(to: square), piece(at: square)) {
        case let (move?, _):
            try! userData.game.perform(move)
            userData.previousMove = move
            userData.validMoves = []
        case let (_, piece?):
            userData.validMoves = userData.game.validMoves(from: .board(square), piece: piece)
        default:
            break
        }
    }

    private func validMove(to square: Square) -> Move? {
        userData.validMoves.first { $0.destination == .board(square) }
    }

    private func piece(at square: Square) -> Piece? {
        userData.game.board[square]
    }

    private func scaleEffect(at square: Square) -> CGFloat {
        userData.validMoves.contains(where: { $0.source == .board(square) }) ? 1.2 : 1
    }

    private func backgroundColor(at square: Square) -> SwiftUI.Color {
        userData.validMoves.contains(where: { $0.destination == .board(square) }) ? Color.black.opacity(0.2) : Color.white
    }
}

struct BoardBoardersView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Path { path in
                    path.addRect(CGRect(origin: .zero, size: geometry.size))
                }
                .stroke(Color.black, lineWidth: 2)

                Path { path in
                    (1 ... File.allCases.count - 1).forEach { index in
                        let x = Const.squareSize * CGFloat(index)
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: geometry.size.height))
                    }
                    (1 ... Rank.allCases.count - 1).forEach { index in
                        let y = Const.squareSize * CGFloat(index)
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: y))
                    }
                }
                .stroke(Color.black.opacity(0.6), lineWidth: 0.5)
            }
        }
        .frame(width: Const.boardWidth, height: Const.boardHeight)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView().environmentObject(UserData(game: Game(sfen: .default)))
    }
}
