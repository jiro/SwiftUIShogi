import SwiftUI
import SwiftShogi

struct ContentView: View {
    var body: some View {
        BoardView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData(game: Game(sfen: .default)))
    }
}
