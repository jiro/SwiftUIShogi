import Combine
import SwiftShogi

final class UserData: ObservableObject {
    @Published var game: Game
    @Published var validMoves: [Move] = []

    init(game: Game) {
        self.game = game
    }
}
