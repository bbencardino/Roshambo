import Foundation

struct Match {

    let player1: Move
    let player2: Move

    init(player1: Move, player2: Move) {
        self.player1 = player1
        self.player2 = player2
    }

    var winner: Move {
        get {
            return player1.defeats(player2) ? player1 : player2
        }
    }

    var loser: Move {
        get {
            return player1.defeats(player2) ? player2 : player1
        }
    }
}
