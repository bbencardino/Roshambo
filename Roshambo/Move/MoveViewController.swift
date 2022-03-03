import UIKit

class MoveViewController: UIViewController {

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
//  rock
    @IBAction func rockPressed(_ sender: Any) {

        let resultsVC: ResultsViewController
        resultsVC = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        resultsVC.viewModel = ResultsViewModel(randomMove: .allCases.randomElement()!, playerMove: .rock)
        present(resultsVC, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let resultsVC = segue.destination as! ResultsViewController

        if segue.identifier == "paperSegue" {

            resultsVC.viewModel = ResultsViewModel(randomMove: .allCases.randomElement()!, playerMove: .paper)


        } else {
            resultsVC.viewModel = ResultsViewModel(randomMove: .allCases.randomElement()!, playerMove: .scissors)
        }
    }
//  paper
    @IBAction func paperPressed(_ sender: Any) {

        performSegue(withIdentifier: "paperSegue", sender: self)
    }
}
