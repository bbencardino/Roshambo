import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    var viewModel: ResultsViewModel!

    lazy var match = viewModel.getResult()
    var gameHistory: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        print(match)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        gameHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        cell.textLabel?.text = gameHistory[indexPath.row]
        return cell
    }
}
