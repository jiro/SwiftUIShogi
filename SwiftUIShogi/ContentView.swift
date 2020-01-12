import SwiftUI
import SwiftShogi

struct ContentView: View {
    var body: some View {
        HStack(spacing: 8) {
            BoardSideView(color: .white)
            BoardView()
            BoardSideView(color: .black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData(game: Game(sfen: .default)))
    }
}
