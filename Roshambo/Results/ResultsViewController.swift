import UIKit

class ResultsViewController: UIViewController {

    var playerChoice: Move!
    var randomChoice: Move!
    var viewModel: ResultsViewModel!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateImage()
        updateResultLabel()
    }

    func updateImage() {
        let imageName = viewModel.getImageName()
        resultView.image = UIImage(named: imageName)
    }
    func updateResultLabel() {
        let resultText = viewModel.getResultLabel()
        resultLabel.text = resultText
    }
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
