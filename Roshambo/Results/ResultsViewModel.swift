import Foundation

struct ResultsViewModel {

    let randomMove: Move
    let playerMove: Move

//MARK: - Update Methods
    
    func getImageName() -> String {

        let turn = [randomMove, playerMove]
        var imageName = ""

        if turn.contains(.paper) && turn.contains(.rock) {
            imageName = "PaperCoversRock"
        } else if turn.contains(.rock) && turn.contains(.scissors) {
            imageName = "RockCrushesScissors"
        } else if turn.contains(.paper) && turn.contains(.scissors) {
            imageName = "ScissorsCutPaper"
        } else {
            imageName = "itsATie"
        }

        return imageName
    }

    func getResultLabel() -> String  {
        let result = compute()
        let text = "\(playerMove) vs. \(randomMove). \(result)"
        return text
    }
    
    //MARK: - Private Functions
    private func compute() -> String {
          // 1. get the move from the player
          // 2. compare the player's move with the random move
          // 3. return if the player is winner
          switch (playerMove,randomMove) {
          case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
             return "You won."
          case (.paper, .paper), (.scissors, .scissors), (.rock, .rock):
              return "It's a tie"
          default:
              return "You lost"
          }
    }
}
