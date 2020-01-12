import SwiftUI
import SwiftShogi

struct Const {
    static let boardFontSize: CGFloat = 24
    static let squareSize: CGFloat = 32
    static let boardWidth = Const.squareSize * CGFloat(File.allCases.count)
    static let boardHeight = Const.squareSize * CGFloat(Rank.allCases.count)
}
