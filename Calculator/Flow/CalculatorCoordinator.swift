import UIKit

class CalculatorCoordinator: Coordinator {
    private let navigationController = UINavigationController()

    override init() {
        super.init()
        rootViewController = navigationController
    }

    override func start() {
        let inputScreen = R.storyboard.input.inputViewController()!
        inputScreen.viewModel.coordinator = self
        navigationController.viewControllers = [inputScreen]
    }
}
