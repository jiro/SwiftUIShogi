import Combine
import SwiftShogi

final class UserData: ObservableObject {
    @Published var game: Game
    @Published var validMoves: [Move] = []
    @Published var previousMove: Move?

    init(game: Game) {
        self.game = game
    }
}

extension UserData {
    func updateForBoard(with square: Square) {
        switch (validMove(to: square), piece(at: square)) {
        case let (move?, _):
            try! game.perform(move)
            previousMove = move
            validMoves = []
        case let (_, piece?):
            validMoves = game.validMoves(from: .board(square), piece: piece)
        default:
            break
        }
    }

    func updateForCapturedPiece(with piece: Piece) {
        validMoves = game.validMoves(from: .capturedPiece, piece: piece)
    }
}

private extension UserData {
    func validMove(to square: Square) -> Move? {
        validMoves.first { $0.destination == .board(square) }
    }

    func piece(at square: Square) -> Piece? {
        game.board[square]
    }
}
