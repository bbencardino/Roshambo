import UIKit

class MoveViewController: UIViewController {

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scisssorsButton: UIButton!
    private let toTheResults = "toTheResults"

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       guard let sender = sender as? UIButton
       else { return }

       guard let resultsVC = segue.destination as? ResultsViewController
       else { return }
       if segue.identifier == toTheResults {
           let playerMove: Move

           if sender == paperButton {
               playerMove = .paper
           } else if sender == rockButton {
               playerMove = .rock
           } else {
               playerMove = .scissors
           }
           resultsVC.viewModel = makeViewModel(player: playerMove)
       }
    }

    @IBAction func chooseMovement(_ sender: UIButton) {

        performSegue(withIdentifier: toTheResults, sender: sender)

    }
    // MARK: - Private Functions

    private func makeViewModel(player: Move) -> ResultsViewModel {

        guard let randomMove: Move = .allCases.randomElement() else {
            fatalError("Random case not found.")
        }

        return ResultsViewModel(playerMove: player, randomMove: randomMove)
    }
}
