import SwiftUI
import SwiftShogi

struct Const {
    static let boardFontSize: CGFloat = 24
    static let boardSideFontSize: CGFloat = 21
    static let squareSize: CGFloat = 32
    static let boardWidth = Const.squareSize * CGFloat(File.allCases.count)
    static let boardHeight = Const.squareSize * CGFloat(Rank.allCases.count)
    static let fontName = "Hiragino Mincho Pro W3"
    static let boldFontName = "Hiragino Sans W6"
}
