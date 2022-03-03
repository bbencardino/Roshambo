import UIKit

class MoveViewController: UIViewController {

    static private let paperSegue = "paperSegue"
    static private let resultsIdentifier = "ResultsViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rockPressed(_ sender: Any) {

        let resultsVC: ResultsViewController
        resultsVC = storyboard?.instantiateViewController(withIdentifier: MoveViewController.resultsIdentifier) as! ResultsViewController
        resultsVC.viewModel = makeViewModel(player: .rock)
        present(resultsVC, animated: true, completion: nil)
    }

    @IBAction func paperPressed(_ sender: Any) {

        performSegue(withIdentifier: MoveViewController.paperSegue, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let resultsVC = segue.destination as! ResultsViewController

        let playerMove: Move = segue.identifier == MoveViewController.paperSegue ? .paper : .scissors
        resultsVC.viewModel = makeViewModel(player: playerMove)
    }

    //MARK: - Private Functions

    private func makeViewModel(player: Move) -> ResultsViewModel {

        guard let randomMove: Move = .allCases.randomElement() else {
            fatalError("Random case not found.")
        }

        return ResultsViewModel(playerMove: player, randomMove: randomMove)
    }
}
