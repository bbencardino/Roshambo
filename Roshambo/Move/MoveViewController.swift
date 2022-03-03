import UIKit

class MoveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rockPressed(_ sender: Any) {

        let resultsVC: ResultsViewController
        resultsVC = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        resultsVC.viewModel = makeViewModel(player: .rock)
        present(resultsVC, animated: true, completion: nil)
    }

    @IBAction func paperPressed(_ sender: Any) {

        performSegue(withIdentifier: "paperSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let resultsVC = segue.destination as! ResultsViewController

        if segue.identifier == "paperSegue" {
            resultsVC.viewModel = makeViewModel(player: .paper)
        } else {
            resultsVC.viewModel = makeViewModel(player: .scissors)
        }
    }

    //MARK: - Private Functions

    private func makeViewModel(player: Move) -> ResultsViewModel {

        guard let randomMove: Move = .allCases.randomElement() else {
            fatalError("Random case not found.")
        }

        return ResultsViewModel(randomMove: randomMove, playerMove: player)
    }
}
