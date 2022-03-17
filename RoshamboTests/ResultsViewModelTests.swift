import XCTest
@testable import Roshambo

class ResultsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testImageItsATie() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .paper, randomMove: .paper)
        //WHEN
        let imageName = viewModel.getImageName()
        //THEN
        XCTAssertEqual(imageName, "itsATie")
    }

    func testImageScissorsAndPaper() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .paper, randomMove: .scissors)
        //WHEN
        let imageName = viewModel.getImageName()
        //THEN
        XCTAssertEqual(imageName, "ScissorsCutPaper")
    }

    func testImageRockAndScissors() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .rock, randomMove: .scissors)
        //WHEN
        let imageName = viewModel.getImageName()
        //THEN
        XCTAssertEqual(imageName, "RockCrushesScissors")
    }

    func testImageRockAndPaper() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .rock, randomMove: .paper)
        //WHEN
        let imageName = viewModel.getImageName()
        //THEN
        XCTAssertEqual(imageName, "PaperCoversRock")
    }

    func testLabel_ItsATie() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .rock, randomMove: .rock)
        //WHEN
        let text = viewModel.getResultLabel()
        //THEN
        XCTAssertEqual(text, "Rock vs. Rock. It's a tie.")
    }

    func testLabel_YouWon() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .paper, randomMove: .rock)
        //WHEN
        let text = viewModel.getResultLabel()
        //THEN
        XCTAssertEqual(text, "Paper vs. Rock. You won.")
    }

    func testLabel_YouLost() {
        //GIVEN
        let viewModel = ResultsViewModel(playerMove: .paper, randomMove: .scissors)
        //WHEN
        let text = viewModel.getResultLabel()
        //THEN
        XCTAssertEqual(text, "Paper vs. Scissors. You lost.")
    }
}
