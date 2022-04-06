import UIKit

class MoveViewController: UIViewController {

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scisssorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       guard let sender = sender as? UIButton
       else { return }

       let playerMove: Move

       if sender == paperButton {
           playerMove = .paper
       } else if sender == rockButton {
           playerMove = .rock
       } else {
           playerMove = .scissors
       }

       if segue.identifier == "toTheResults" {
           let resultsVC = segue.destination as! ResultsViewController
           resultsVC.viewModel = makeViewModel(player: playerMove)
           resultsVC.viewModel.gameHistory.append(resultsVC.viewModel.match)


       }
       else if segue.identifier == "toGameHistory" {
           let historyVC = segue.destination as! HistoryViewController
           historyVC.viewModel = makeViewModel(player: playerMove)
           historyVC.gameHistory.append(historyVC.viewModel.getResult())

       }
    }

    @IBAction func moveChoce(_ sender: UIButton) {
        performSegue(withIdentifier: "toTheResults", sender: sender)

    }

    @IBAction func seeGameHistory(_ sender: UIButton) {}
    
    //MARK: - Private Functions

    private func makeViewModel(player: Move) -> ResultsViewModel {

        guard let randomMove: Move = .allCases.randomElement() else {
            fatalError("Random case not found.")
        }

        return ResultsViewModel(playerMove: player, randomMove: randomMove)
    }
}
