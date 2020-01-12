import SwiftUI
import SwiftShogi

extension Piece {
    var string: String {
        switch kind {
        case .pawn(.normal): return "歩"
        case .pawn(.promoted): return "と"
        case .lance(.normal): return "香"
        case .lance(.promoted): return "杏"
        case .knight(.normal): return "桂"
        case .knight(.promoted): return "圭"
        case .silver(.normal): return "銀"
        case .silver(.promoted): return "全"
        case .gold: return "金"
        case .bishop(.normal): return "角"
        case .bishop(.promoted): return "馬"
        case .rook(.normal): return "飛"
        case .rook(.promoted): return "龍"
        case .king: return "玉"
        }
    }
}

extension SwiftShogi.Color {
    var string: String {
        switch self {
        case .black: return "☗"
        case .white: return "☖"
        }
    }

    var angle: Angle {
        switch self {
        case .black: return .degrees(0)
        case .white: return .degrees(180)
        }
    }
}
