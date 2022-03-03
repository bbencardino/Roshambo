import UIKit

class ResultsViewController: UIViewController {

    var viewModel: ResultsViewModel!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateImage()
        updateResultLabel()
    }

    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

//MARK: - Private/Update Functions
    private func updateImage() {
        let imageName = viewModel.getImageName()
        resultView.image = UIImage(named: imageName)
    }

    private func updateResultLabel() {
        let resultText = viewModel.getResultLabel()
        resultLabel.text = resultText
    }
}
