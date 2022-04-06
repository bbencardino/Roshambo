import UIKit

class ResultsViewController: UIViewController {

    var viewModel: ResultsViewModel!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Play again", style: .plain, target: self, action: #selector(playAgain))

        updateImage()
        updateResultLabel()
    }

    @objc private func playAgain(_ sender: Any) {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
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
